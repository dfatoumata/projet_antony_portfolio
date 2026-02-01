#  Analyse Complète du Marché Immobilier d'Antony (2017-2025) 

> Étude longitudinale en 2 phases du marché immobilier d'Antony (92) avec modélisation prédictive - Projet Portfolio
---

##  Vue d'Ensemble du Projet

Ce repository présente une **analyse complète et longitudinale** du marché immobilier de la commune d'Antony (Hauts-de-Seine, 92) 
sur **8 ans** (2017-2025), réalisée pour l'agence immobilière **Piazza Margherita** (fictif).

Le projet se structure en **2 phases complémentaires** :

###  [Phase 1 : Analyse Rétrospective] (https://github.com/dfatoumata/projet_antony_portfolio/tree/main/partie1_situation_globale_2017_2021)
**Comprendre le passé** - Diagnostic du marché et impact COVID

###  [Phase 2 : Analyse Prédictive S1 2025] (https://github.com/dfatoumata/projet_antony_portfolio/tree/main/partie2_immobilier_antony_S1_2025)
**Prédire l'avenir** - Modèles statistiques et outils d'aide à la décision

---

##  Objectifs Globaux

### Stratégiques
-  Établir un **diagnostic complet** du marché immobilier d'Antony
- Mesurer l'**évolution sur 8 ans** (2017-2025)
-  Quantifier l'**impact de la crise COVID-19** (2020-2021)
- Positionner Antony vs autres communes du réseau
- Développer des **modèles prédictifs** opérationnels

### Opérationnels
- Créer des **outils d'aide à la décision** pour conseillers
-  Établir un **guide budget-client** par taille de logement
-  Prédire **surface = f(prix)** par type de bien
-  Estimer **prix = f(caractéristiques)** avec régression multiple

---

## Données Analysées

| Phase       | Période   | Transactions | Années | Fichier   |
|-------------|-----------|--------------|--------|-----------|
| **Phase 1** | 2017-2021 | **3 597**    | 5 ans  | DVF.RDS   |
| **Phase 2** | S1 2025   | **270**      | 6 mois | DVF2025_S1|
| **TOTAL**   | 2017-2025 | **3 867**    | 8 ans  | -         |

**Source** : DVF (Demandes de Valeurs Foncières) - Etalab (Open Data)

---

##  Résultats Clés Globaux

### ️ Structure du Marché (Stable sur 8 ans)

| Type de Bien     | 2017-2021   | S1 2025  | Tendance      |
|------------------|-------------|----------|---------------|
| **Appartements** | 66% (2 389) | 72% (194)| Légère hausse |
| **Maisons**      | 33% (1 208) | 28% (76) | Légère baisse |

**Insight** : Domination stable de l'habitat collectif, caractéristique d'une commune urbaine dense.

---

###  Évolution des Prix au m²

| Période                       | Médiane    | Évolution vs Période Précédente |
|-------------------------------|------------|---------------------------------|
| **2017-2019** (avant COVID)   | 4 560 €/m² | -                               |
| **2020-2021** (pendant COVID) | 5 214 €/m² | **+14,3%**                      |
| **S1 2025** (actuel)          | ~5 500 €/m²| **+5,5%**                       |

**Conclusion** : **Croissance continue sur 8 ans** - Aucune baisse, même pendant COVID.

---

###  Résilience Exceptionnelle Pendant COVID

**Appartements** :
```
Avant COVID (2017-2019) : 4 560 €/m²
Pendant COVID (2020-2021) : 5 214 €/m²
Évolution : +654 €/m² (+14,3%) 
```

**Maisons** :
```
Avant COVID (2017-2019) : 5 680 €/m²
Pendant COVID (2020-2021) : 6 160 €/m²
Évolution : +480 €/m² (+8,5%) 
```

**Conclusion** : Pas de baisse malgré crise

---

## Accès Rapide aux Rapports

### Rapports HTML Complets

| Phase        | Lien Direct |
|--------------|-------------|
| ** Phase 1** | [Voir Rapport 2017-2021](https://dfatoumata.github.io/projet_antony_portfolio/partie1_situation_globale_2017_2021/Rapport_Antony_Commune.html) |
| ** Phase 2** | [Voir Rapport S1 2025](https://dfatoumata.github.io/projet_antony_portfolio/partie2_immobilier_antony_S1_2025/Rapport_antonye_fatoumata.html)     |        

### Documentation Détaillée

| Phase       | README                                                              | Contenu                                    |
|-------------|---------------------------------------------------------------------|--------------------------------------------|
| **Phase 1** | [README_partie1.md](https://github.com/dfatoumata/projet_antony_portfolio/blob/main/partie1_situation_globale_2017_2021/README_projet1.md)| Méthodologie, résultats, insights Phase 1  |
| **Phase 2** | [README_partie2.md](https://github.com/dfatoumata/projet_antony_portfolio/blob/main/partie2_immobilier_antony_S1_2025/README_projet2.md)  | Modèles, formules, recommandations Phase 2 |

---

##  PHASE 1 : Analyse Rétrospective (2017-2021)

###  Objectifs
Établir un diagnostic complet du marché sur 5 ans et mesurer l'impact de la crise COVID-19.

###  Données
- **Période**: 2017-2021 (5 ans)
- **Volume** : 3 597 transactions
- **Type**   : Analyse descriptive et comparative

###  Analyses Réalisées

1. **Structure du marché** : Répartition maisons/appartements
2. **Analyse des prix**    : Distribution, prix au m², comparaisons
3. **Positionnement**      : Antony vs autres communes du réseau
4. **Impact COVID**        : Avant (2017-2019) vs Pendant (2020-2021)
5. **Caractéristiques**    : Superficie, pièces, accessibilité transports

###  Résultats Clés Phase 1

| Indicateur                  | Valeur                       |
|-----------------------------|-------------------------------|
| **Répartition marché**      | 66% appartements, 33% maisons |
| **Prix médian global**      | 5 160 €/m²                    |
| **Écart maisons/appart**    | +1 044 €/m² (+21,8%)          |
| **Positionnement**          | **+31,6%** vs réseau          |
| **Croissance COVID appart** | **+14,3%** (aucune baisse)    |
| **Croissance COVID maisons**| **+8,5%** (aucune baisse)     |
| **Distance gare médiane**   | 500 m (excellente desserte)   |

###  Insights Majeurs

 **Marché premium** : Antony parmi les communes les plus aisées  
 **Résilience COVID** : Croissance maintenue (valeur refuge)  
 **Accessibilité** : 75% des biens < 650m de la gare  
 **Stabilité** : Volume transactions constant  

---

##  PHASE 2 : Analyse Prédictive (S1 2025)

###  Objectifs
Créer des outils opérationnels pour sélectionner les biens selon les budgets clients.

### Données
- **Période** : S1 2025 (6 mois)
- **Volume** : 270 transactions
- **Type** : Modélisation prédictive

###  Analyses Réalisées

1. **Segmentation** : Petits (1-2p), Standard (3-4p), Grands (5+p)
2. **Guide budget-client** : Tableaux de correspondance opérationnels
3. **Modèles Surface = f(Prix)** : Régression simple par type
4. **Modèle Prix = f(Caractéristiques)** : Régression multiple

### Résultats Clés Phase 2

#### Segmentation du Marché

| Segment             | Transactions | %      | Prix Médian Appart | Prix Médian Maison |
|---------------------|--------------|--------|--------------------|--------------------|
| **Petits (1-2p)**   | 57           | 21%    | 198 000 €          | 502 000 €     |
| **Standard (3-4p)** | 160          | **59%**| 359 000 €          | 530 000 €          |
| **Grands (5+p)**    | 53           | 20%    | 430 000 €          | 653 000 €          |

#### Guide Budget-Client

| Budget        | Recommandation                             |
|---------------|--------------------------------------------|
| **< 200k€**   | Appartements 1-2p                          |
| **200-400k€** | Appartements 3-4p (offre large)            |
| **400-650k€** | Zone transition (appart premium OU maison) |
| **> 650k€**   | Privilégier maisons (meilleur rapport)     |

#### Modèles Prédictifs

**Modèle 1 : Appartements**
```
Surface (m²) = 27,8 + 0,000111 × Prix (€)
R² = 0,596 (60%) - BON pouvoir prédictif 
+100k€ → +11 m²
```

**Modèle 2 : Maisons**
```
Surface (m²) = 31,5 + 0,000119 × Prix (€)
R² = 0,345 (34%) - Pouvoir prédictif modéré
+100k€ → +12 m²
```

**Modèle 3 : Prix Global**
```
Prix = 87 344 + 3 941×Superficie + 118 504×Type_Maison
R² = 0,618 (62%) - Modèle robuste 
```

###  Insights Majeurs

 **Segment 3-4p** = Cœur de marché (59% transactions)  
 **Appartements** = Plus prévisibles (R² 0,60 vs 0,34)  
 **Prime maison** = +118 500 € (à surface égale)  
 **Nb pièces** = Non significatif (seule la surface compte)  

###  Outils Livrés

1. **Guide budget-client** (tableau décisionnel)
2. **Calculateur prix** (modèle régression)
3. **Recommandations personnalisées** par budget


---

##  Compétences Démontrées

###  Analyse de Données
 Statistiques descriptives avancées (médiane, quartiles, écart-type)  
 Tests d'hypothèses (t-test, Wilcoxon)  
 Analyse comparative multi-groupes  
 Séries temporelles (évolution annuelle)  
 Segmentation marché multi-critères  

###  Modélisation Statistique
 Régression linéaire simple (2 modèles)  
 Régression linéaire multiple (1 modèle)  
 Évaluation modèles   
 Diagnostics de régression (résidus, normalité)  
 Corrélations (Pearson, Spearman)  

###  Programmation R
  Manipulation data frames 
  Création variables dérivées 
  Fonctions statistiques 
  Visualisations   
  Boucles, conditions, automatisation  

### Communication & Reporting
  Rapports professionnels reproductibles (Quarto/RMarkdown)  
  Vulgarisation résultats statistiques  
  Recommandations business actionnables  
  Documentation technique complète (README)  
  Visualisations claires et informatives  

###  Business Intelligence
 Outils d'aide à la décision opérationnels  
  Guide décisionnel budget-client  
  Benchmarking (Antony vs réseau)  
  Analyse d'impact (crise COVID)  
  Priorisation insights selon valeur business  

---

### Pour une Agence Immobilière

**Valeur ajoutée immédiate** :

1. **Guide budget-client**   : Gain temps 30% (pré-sélection biens)
2. **Calculateurs**          :Réponse instantanée clients ("Quelle surface pour mon budget ?")
3. **Résilience COVID**      : Rassurer vendeurs/acheteurs (pas de baisse observée)


---

## Comparaison Phase 1 vs Phase 2

| Critère                | Phase 1 (2017-2021)         | Phase 2 (S1 2025)            |
|------------------------|-----------------------------|------------------------------|
| **Objectif**           | Diagnostic                  | Prédiction                   |
| **Type analyse**       | Descriptive + Comparative   | Modélisation                 |
| **Volume**             | 3 597 transactions          | 270 transactions             |
| **Durée**              | 5 ans                       | 6 mois                       |
| **Techniques**         | Stats descriptives, t-tests | Régression simple + multiple |
| **Livrables**          | Rapport diagnostic          | Outils opérationnels         |
| **Impact COVID**       |  Mesuré                     | -                            |
| **Modèles prédictifs** | -                           |  3 modèles (R² 0,34-0,62)    |
| **Guide client**       | -                           | Tableaux décisionnels        |

**Complémentarité** : Phase 1 = Contexte historique  | Phase 2 = Actions concrètes

---

##  Structure
```
projet_antony_portfolio
│
├── README.md                              #  Ce fichier
│
├── partie1_situation_globale_2017_2021    # PHASE 1 : Rétrospective
│   ├── README_projet1.md                  # Documentation détaillée Phase 1
│   ├── data/
│   │   └── DVF.RDS                        # Base 2017-2021 (3,597 obs)
│   ├── images                             # Photo Antony
│   ├── rapport_2017-2021.qmd              # Code source Quarto
│   └── rapport_2017-2021.html             # Rapport HTML 
│
├── Partie2_immobilier_antony_S1_2025      #  PHASE 2 : Prédictive
│   ├── README_projet2.md                  # Documentation détaillée Phase 2
│   ├── data/
│   │   └── DVF2025_S1.RDS                 # Base S1 2025 
│   ├── images                             # Logo agence
│   ├── rapport_2025.qmd                   # Code source Quarto
│   └── rapport_2025.html                  # Rapport HTML 
│
└── .gitignore
```
##  [Simulateur)] (https://fatoumatadiallo2004.shinyapps.io/antony/)
 
 
---
##  Contact

**Fatoumata Diallo**    
Email : fatimediallo111@gmail.com
 
---
*Dernière mise à jour : Janvier 2026*  
```
---