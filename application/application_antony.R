library(shiny)
library(shinydashboard)
library(ggplot2)
library(DT)

# Interface utilisateur
ui <- dashboardPage(
  dashboardHeader(title = "Antony S1 2025"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Vue d'ensemble", tabName = "overview", icon = icon("dashboard")),
      menuItem("Guide Budget Client", tabName = "budget", icon = icon("euro-sign")),
      menuItem("Simulateur Surface", tabName = "simulateur", icon = icon("calculator")),
      menuItem("Analyse Prix/Pièces", tabName = "pieces", icon = icon("chart-bar"))
    )
  ),
  
  dashboardBody(
    tabItems(
      # Onglet Vue d'ensemble
      tabItem(tabName = "overview",
              fluidRow(
                valueBox(270, "Transactions S1 2025", icon = icon("home"), color = "blue"),
                valueBox("380 k€", "Prix médian", icon = icon("euro-sign"), color = "green"),
                valueBox("5 015 €/m²", "Prix moyen au m²", icon = icon("chart-line"), color = "orange")
              ),
              fluidRow(
                box(title = "Répartition par type", status = "primary", solidHeader = TRUE,
                    plotOutput("plot_repartition", height = 300)),
                box(title = "Distribution des prix", status = "success", solidHeader = TRUE,
                    plotOutput("plot_prix", height = 300))
              ),
              fluidRow(
                box(title = "Statistiques clés", status = "info", solidHeader = TRUE, width = 12,
                    DTOutput("table_stats"))
              )
      ),
      
      # Onglet Guide Budget
      tabItem(tabName = "budget",
              fluidRow(
                box(title = "Guide opérationnel Budget-Client", status = "primary", 
                    solidHeader = TRUE, width = 12,
                    DTOutput("table_budget"))
              ),
              fluidRow(
                box(title = "Prix médians par catégorie", status = "warning",
                    solidHeader = TRUE, width = 12,
                    plotOutput("plot_medians", height = 400))
              )
      ),
      
      # Onglet Simulateur
      tabItem(tabName = "simulateur",
              fluidRow(
                box(title = "Paramètres du client", status = "primary", solidHeader = TRUE, width = 4,
                    numericInput("budget", "Budget disponible (€):", 
                                 value = 400000, min = 50000, max = 1500000, step = 10000),
                    radioButtons("type_bien", "Type de bien recherché:",
                                 choices = c("Appartement", "Maison"),
                                 selected = "Appartement"),
                    actionButton("calculer", "Calculer", class = "btn-primary")
                ),
                box(title = "Prédiction de surface", status = "success", solidHeader = TRUE, width = 8,
                    h3(textOutput("surface_prevue")),
                    h4(textOutput("intervalle_confiance")),
                    plotOutput("plot_prediction", height = 300)
                )
              ),
              fluidRow(
                box(title = "Conseils personnalisés", status = "info", solidHeader = TRUE, width = 12,
                    htmlOutput("conseils"))
              )
      ),
      
      # Onglet Analyse Prix/Pièces
      tabItem(tabName = "pieces",
              fluidRow(
                box(title = "Prix selon nombre de pièces et type", status = "primary",
                    solidHeader = TRUE, width = 12,
                    plotOutput("plot_pieces_prix", height = 400))
              ),
              fluidRow(
                box(title = "Tableau récapitulatif", status = "warning",
                    solidHeader = TRUE, width = 12,
                    DTOutput("table_pieces"))
              )
      )
    )
  )
)

# Serveur
server <- function(input, output, session) {
  
  # Chargement des données (simulation basée sur le rapport)
  don <- reactive({
    set.seed(123)
    
    # Simulation des appartements
    appart <- data.frame(
      type = "Appartement",
      prix = c(rnorm(55, 198000, 80000), 
               rnorm(122, 359000, 110000),
               rnorm(17, 430000, 150000)),
      nbp = c(rep(1:2, length.out = 55),
              rep(3:4, length.out = 122),
              rep(5:7, length.out = 17)),
      sup = c(rnorm(55, 45, 12),
              rnorm(122, 72, 18),
              rnorm(17, 95, 25))
    )
    
    # Simulation des maisons
    maisons <- data.frame(
      type = "Maison",
      prix = c(rnorm(2, 502000, 50000),
               rnorm(38, 530000, 90000),
               rnorm(36, 653000, 150000)),
      nbp = c(rep(1:2, length.out = 2),
              rep(3:4, length.out = 38),
              rep(5:7, length.out = 36)),
      sup = c(rnorm(2, 85, 15),
              rnorm(38, 103, 28),
              rnorm(36, 125, 35))
    )
    
    rbind(appart, maisons)
  })
  
  # Vue d'ensemble - Répartition
  output$plot_repartition <- renderPlot({
    tab <- table(don()$type)
    prop <- prop.table(tab) * 100
    
    barplot(tab, col = c("steelblue", "coral"),
            main = "", ylab = "Nombre de ventes",
            ylim = c(0, max(tab) * 1.2))
    text(x = c(0.7, 1.9), y = tab + 10,
         labels = paste0(round(prop, 1), "%"), font = 2)
  })
  
  # Vue d'ensemble - Distribution prix
  output$plot_prix <- renderPlot({
    hist(don()$prix / 1000, breaks = 20, col = "lightblue",
         border = "white", main = "",
         xlab = "Prix (milliers €)", ylab = "Fréquence")
    abline(v = median(don()$prix) / 1000, col = "red", lwd = 2, lty = 2)
    legend("topright", legend = "Médiane", col = "red", lty = 2, lwd = 2)
  })
  
  # Table statistiques
  output$table_stats <- renderDT({
    df <- don()
    
    stats <- data.frame(
      Type = c("Appartement", "Maison", "TOTAL"),
      N_ventes = c(sum(df$type == "Appartement"),
                   sum(df$type == "Maison"),
                   nrow(df)),
      Prix_median = c(median(df$prix[df$type == "Appartement"]),
                      median(df$prix[df$type == "Maison"]),
                      median(df$prix)),
      Prix_moyen = c(mean(df$prix[df$type == "Appartement"]),
                     mean(df$prix[df$type == "Maison"]),
                     mean(df$prix)),
      Surf_mediane = c(median(df$sup[df$type == "Appartement"]),
                       median(df$sup[df$type == "Maison"]),
                       median(df$sup))
    )
    
    stats$Prix_median <- paste0(format(round(stats$Prix_median / 1000), big.mark = " "), " k€")
    stats$Prix_moyen <- paste0(format(round(stats$Prix_moyen / 1000), big.mark = " "), " k€")
    stats$Surf_mediane <- paste0(round(stats$Surf_mediane), " m²")
    
    datatable(stats, options = list(dom = 't'), rownames = FALSE,
              colnames = c("Type", "N ventes", "Prix médian", "Prix moyen", "Surface médiane"))
  })
  
  # Table guide budget
  output$table_budget <- renderDT({
    budget_guide <- data.frame(
      Budget = c("< 200 k€", "200-300 k€", "300-400 k€", "400-500 k€", 
                 "500-650 k€", "650-850 k€", "> 850 k€"),
      Appartements = c("1-2p (rares)", "1-2p (courant)", "3-4p (entrée)",
                       "3-4p (courant), 5+p (rares)", "3-4p (premium), 5+p (courant)",
                       "5+p (premium)", "5+p (exception)"),
      Maisons = c("Quasi inexistant", "Quasi inexistant", "Rares opportunités",
                  "3-4p (entrée)", "3-4p (courant)", "3-4p (premium), 5+p (courant)",
                  "5+p (premium)"),
      Conseil = c("Orienter vers appartements 1-2p",
                  "Appartements 1-2p ou petits 3p",
                  "Appartements 3-4p - offre large",
                  "Choix entre appart 4p ou maison 3p",
                  "Zone de transition - 2 options viables",
                  "Privilégier maisons - meilleur rapport",
                  "Segment premium - maisons dominantes")
    )
    
    datatable(budget_guide, options = list(pageLength = 10, dom = 't'),
              rownames = FALSE) %>%
      formatStyle(columns = 1:4, fontSize = '95%')
  })
  
  # Graphique médians
  output$plot_medians <- renderPlot({
    df <- don()
    
    medians <- data.frame(
      Categorie = c("1-2p Appart", "3-4p Appart", "5+p Appart",
                    "1-2p Maison", "3-4p Maison", "5+p Maison"),
      Median = c(
        median(df$prix[df$type == "Appartement" & df$nbp <= 2]),
        median(df$prix[df$type == "Appartement" & df$nbp >= 3 & df$nbp <= 4]),
        median(df$prix[df$type == "Appartement" & df$nbp >= 5]),
        median(df$prix[df$type == "Maison" & df$nbp <= 2]),
        median(df$prix[df$type == "Maison" & df$nbp >= 3 & df$nbp <= 4]),
        median(df$prix[df$type == "Maison" & df$nbp >= 5])
      ),
      Type = c(rep("Appartement", 3), rep("Maison", 3))
    )
    
    ggplot(medians, aes(x = Categorie, y = Median / 1000, fill = Type)) +
      geom_bar(stat = "identity") +
      geom_text(aes(label = paste0(round(Median / 1000), " k€")), 
                vjust = -0.5, size = 4) +
      scale_fill_manual(values = c("Appartement" = "steelblue", "Maison" = "coral")) +
      labs(title = "", x = "", y = "Prix médian (milliers €)") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 11),
            legend.position = "top")
  })
  
  # Simulateur - Calculs
  predictions <- eventReactive(input$calculer, {
    budget <- input$budget
    type <- input$type_bien
    
    # Modèles basés sur le rapport
    if (type == "Appartement") {
      surf <- 27.8 + 0.000111 * budget
      marge <- 14.5 * 1.96  # Intervalle à 95%
    } else {
      surf <- 31.5 + 0.000119 * budget
      marge <- 36.5 * 1.96
    }
    
    list(surface = surf, 
         inf = surf - marge/surf * 100 * 0.05,  # Approximation
         sup = surf + marge/surf * 100 * 0.05,
         type = type,
         budget = budget)
  })
  
  output$surface_prevue <- renderText({
    pred <- predictions()
    paste0("Surface prévue : ", round(pred$surface), " m²")
  })
  
  output$intervalle_confiance <- renderText({
    pred <- predictions()
    paste0("Fourchette réaliste : [", round(pred$inf), " - ", round(pred$sup), " m²]")
  })
  
  output$plot_prediction <- renderPlot({
    pred <- predictions()
    df <- don()
    df_type <- df[df$type == pred$type, ]
    
    plot(df_type$prix / 1000, df_type$sup,
         pch = 19, col = rgb(0, 0, 1, 0.3),
         xlab = "Prix (milliers €)", ylab = "Surface (m²)",
         main = paste("Prédiction pour", pred$type))
    
    if (pred$type == "Appartement") {
      abline(a = 27.8, b = 0.000111 * 1000, col = "red", lwd = 2)
    } else {
      abline(a = 31.5, b = 0.000119 * 1000, col = "red", lwd = 2)
    }
    
    points(pred$budget / 1000, pred$surface, pch = 19, col = "darkgreen", cex = 2)
    text(pred$budget / 1000, pred$surface, 
         labels = paste0(round(pred$surface), " m²"),
         pos = 3, col = "darkgreen", font = 2)
  })
  
  output$conseils <- renderUI({
    pred <- predictions()
    budget <- pred$budget / 1000
    
    conseil <- if (budget < 200) {
      "<b>Budget < 200k€</b> : Orienter exclusivement vers les appartements 1-2 pièces. 
      Les maisons sont quasi inexistantes dans cette gamme."
    } else if (budget < 400) {
      "<b>Budget 200-400k€</b> : Privilégier les appartements 3-4 pièces (offre abondante). 
      Possibilité de maisons en haut de fourchette."
    } else if (budget < 650) {
      "<b>Budget 400-650k€</b> : Zone charnière ! Comparer appartements haut de gamme 
      et maisons d'entrée de gamme selon priorités (jardin vs praticité)."
    } else {
      "<b>Budget > 650k€</b> : Privilégier les maisons qui dominent ce segment premium 
      et offrent le meilleur rapport qualité/espace."
    }
    
    HTML(paste0("<div style='padding: 15px; background-color: #f0f8ff; border-left: 4px solid #4682b4;'>",
                conseil, "</div>"))
  })
  
  # Analyse prix/pièces
  output$plot_pieces_prix <- renderPlot({
    df <- don()
    
    ggplot(df, aes(x = factor(nbp), y = prix / 1000, fill = type)) +
      geom_boxplot() +
      scale_fill_manual(values = c("Appartement" = "steelblue", "Maison" = "coral")) +
      labs(title = "Distribution des prix selon le nombre de pièces",
           x = "Nombre de pièces", y = "Prix (milliers €)",
           fill = "Type de bien") +
      theme_minimal() +
      theme(legend.position = "top", text = element_text(size = 12))
  })
  
  output$table_pieces <- renderDT({
    df <- don()
    
    recap <- data.frame(
      Taille = c("Petits (1-2p)", "Standard (3-4p)", "Grands (5+p)"),
      N_Appart = c(
        sum(df$type == "Appartement" & df$nbp <= 2),
        sum(df$type == "Appartement" & df$nbp >= 3 & df$nbp <= 4),
        sum(df$type == "Appartement" & df$nbp >= 5)
      ),
      Median_Appart = c(
        median(df$prix[df$type == "Appartement" & df$nbp <= 2]),
        median(df$prix[df$type == "Appartement" & df$nbp >= 3 & df$nbp <= 4]),
        median(df$prix[df$type == "Appartement" & df$nbp >= 5])
      ),
      N_Maison = c(
        sum(df$type == "Maison" & df$nbp <= 2),
        sum(df$type == "Maison" & df$nbp >= 3 & df$nbp <= 4),
        sum(df$type == "Maison" & df$nbp >= 5)
      ),
      Median_Maison = c(
        median(df$prix[df$type == "Maison" & df$nbp <= 2]),
        median(df$prix[df$type == "Maison" & df$nbp >= 3 & df$nbp <= 4]),
        median(df$prix[df$type == "Maison" & df$nbp >= 5])
      )
    )
    
    recap$Median_Appart <- paste0(format(round(recap$Median_Appart / 1000), big.mark = " "), " k€")
    recap$Median_Maison <- paste0(format(round(recap$Median_Maison / 1000), big.mark = " "), " k€")
    
    datatable(recap, options = list(dom = 't'), rownames = FALSE,
              colnames = c("Taille", "N (App)", "Médiane (App)", "N (Maison)", "Médiane (Maison)"))
  })
}

# Lancer l'application

shinyApp(ui, server)

