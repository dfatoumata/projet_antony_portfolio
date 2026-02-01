# Projet 1 : Analyse Rétrospective du Marché Immobilier d'Antony (2017-2021)

> Étude statistique du marché immobilier d'Antony sur 5 ans avec analyse de l'impact de la crise COVID-19

---

##  Contexte du Projet

Cette première phase d'analyse a été réalisée pour l'agence immobilière **Piazza Margherita** dans le cadre d'une étude 
de positionnement stratégique sur le marché d'Antony (Hauts-de-Seine, 92).

**Commanditaire** : Margherita Piazza (PDG)  
**Analyste** : Fatoumata Diallo  
**Date de publication** : 16 octobre 2025  
**Type** : Rapport confidentiel n°1  

---

## Objectifs de l'Étude

1. **Comprendre la structure du marché** : Répartition maisons/appartements, volumes de transactions
2. **Analyser les prix** : Évolution des prix au m², comparaison par type de bien
3. **Évaluer le positionnement** : Situer Antony par rapport aux autres communes du réseau
4. **Mesurer l'impact COVID-19** : Quantifier les effets de la crise sanitaire sur le marché (2020-2021)
5. **Identifier les caractéristiques structurelles** : Superficie, nombre de pièces, accessibilité

---

##  Données Utilisées

### Source
**DVF (Demandes de Valeurs Foncières)** - Base de données publique 

### Caractéristiques
- **Période** : 2017-2021 (5 années complètes)
- **Volume** : 3 597 transactions immobilières
- **Périmètre** : Commune d'Antony (code INSEE : 92002)
- **Fichier** : `data/DVF.RDS`

### Variables Analysées
```
- type : Type de bien (Maison / Appartement)
- prix : Prix de vente (€)
- sup : Superficie (m²)
- prix_m2 : Prix au m² (calculé)
- nbp : Nombre de pièces
- ann : Année de transaction
- dist_gare : Distance à la gare (m)
- com_code : Code commune
- com_nom : Nom commune
```

---

##  Résultats Clés

###  Structure du Marché

| Indicateur             | Valeur | Proportion |
|------------------------|--------|------------|
| **Appartements vendus**| 2 389  | **66%**    |
| **Maisons vendues**    | 1 208  | **33%**    |
| **Total transactions** | 3 597  | 100%       |

**Insight** : Nette domination de l'habitat collectif, caractéristique d'une commune urbaine dense.

---

###  Prix au m² Globaux (2017-2021)

| Statistique            | Valeur     |
|------------------------|------------|
| **Médiane**            | 5 160 €/m² |
| **Moyenne**            | 5 364 €/m² |
| **1er Quartile (Q1)**  | 4 175 €/m² |
| **3ème Quartile (Q3)** | 6 269 €/m² |
| **Minimum**            | 609 €/m²   |
| **Maximum**            | 17 797 €/m²|
| **Étendue**            | 17 188 €/m²|

**Distribution** : La moitié des biens se vend entre 4 175 €/m² et 6 269 €/m².

---

###  Comparaison Maisons vs Appartements

#### Prix au m²

| Type             | Médiane         | Moyenne         | Q1         | Q3         |
|------------------|-----------------|-----------------|------------|------------|
| **Maisons**      | 5 846 €/m²      | 6 178 €/m²      | 4 889 €/m² | 7 125 €/m² |
| **Appartements** | 4 802 €/m²      | 4 953 €/m²      | 3 954 €/m² | 5 836 €/m² |
| **Écart**        | **+1 044 €/m²** | **+1 225 €/m²** | +935 €/m²  | +1 289 €/m²|
| **% Supérieur**  | **+21,8%**      | **+24,7%**      | +23,6%     | +22,1%     |

**Test statistique** : Différence très hautement significative (t-test, p < 0,001)

#### Caractéristiques Structurelles

| Caractéristique            | Maisons    | Appartements | Écart    |
|----------------------------|------------|--------------|----------|
| **Superficie moyenne**     | 106 m²     | 62 m²        | **+71%** |
| **Nombre de pièces moyen** | 4,6 pièces | 2,9 pièces   | **+59%** |

**Explication** : Les maisons offrent plus d'espace (jardin, terrain) et plus de pièces, justifiant une prime de valorisation de ~22%.

---

###  Positionnement d'Antony dans le Réseau

#### Comparaison avec les Autres Communes

| Indicateur                   | Antony     | Moyenne Réseau | Écart           |
|------------------------------|------------|----------------|-----------------|
| **Prix médian global**       | 5 160 €/m² | 3 920 €/m²     | **+1 240 €/m²** |
| **% Supérieur**              | -          | -              | **+31,6%**      |
| **Prix médian maisons**      | 6 178 €/m² | 4 743 €/m²     | +1 435 €/m²     |
| **Prix médian appartements** | 4 953 €/m² | 3 927 €/m²     | +1 026 €/m²     |

**Conclusion** : Antony se positionne parmi les **communes les plus aisées** du réseau Piazza Margherita, avec une valorisation supérieure de **31,6%** à la moyenne.

---

###  Impact de la Crise COVID-19 (2020-2021)

#### Évolution des Prix Médians

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

#### Analyse

| Type de Bien     | Évolution | Interprétation                                                |
|------------------|-----------|---------------------------------------------------------------|
| **Appartements** | **+14,3%**| Forte progression - Attractivité centre-ville + RER maintenue |
| **Maisons**      | **+8,5%** | Croissance modérée - Segment premium déjà valorisé            |

**Insight majeur** : **Aucune baisse de prix pendant la crise**. Au contraire, le marché a maintenu une progression constante,
 confirmant Antony comme **valeur refuge** dans le paysage immobilier francilien.

---

###  Accessibilité aux Transports

| Indicateur                     | Valeur |
|--------------------------------|--------|
| **Distance médiane à la gare** | 500 m  |
| **75% des biens**              | < 650 m|
| **Distance moyenne**           | 563 m  |

**Accessibilité** : **Excellente** - RER B place Paris centre à moins de 20 minutes.

---


##  Insights Business

### Pour l'Agence Piazza Margherita

#### Opportunités Identifiées

1. **Marché Premium** : Antony = commune aisée (+31,6% vs réseau)
   - Clientèle à fort pouvoir d'achat
   - Marges commerciales substantielles possibles

2. **Résilience Démontrée** : Croissance maintenue pendant COVID
   - Argument commercial pour rassurer vendeurs/acheteurs
   - Valeur refuge confirmée

3. **Segment Maisons** : Prime de +22% maintenue
   - Rareté relative = levier de valorisation
   - Produit premium à développer

4. **Accessibilité Transports** : Atout majeur (50% biens < 500m gare)
   - Argument de vente clé
   - Attractivité pérenne

#### Recommandations Stratégiques

**Pour les Vendeurs** :
- Valoriser la résilience du marché pendant COVID
- Mettre en avant le positionnement premium d'Antony
- Insister sur l'accessibilité (RER B, Paris < 20 min)

**Pour les Acheteurs** :
- Rassurer sur la solidité du marché (pas de baisse pendant crise)
- Investissement sûr dans valeur refuge francilienne
- Excellente qualité de vie + desserte exceptionnelle

**Pour l'Agence** :
- Maintenir présence forte sur ce marché stratégique
- Développer expertise segment maisons (marges supérieures)
- Capitaliser sur données pour conseil personnalisé

---

##  Conclusion de la partie 1

Cette première phase d'analyse a permis d'établir un **diagnostic complet** du marché immobilier 
d'Antony sur la période 2017-2021. Les principaux enseignements sont :

1. **Marché structurellement solide** : Dominance appartements (66%), prix médian élevé (5 160 €/m²)
2. **Positionnement premium** : +31,6% au-dessus de la moyenne du réseau
3. **Résilience exceptionnelle** : Croissance maintenue pendant COVID (+14,3% appart, +8,5% maisons)
4. **Différenciation maisons/appartements** : Prime maison de +22% justifiée

Ces résultats constituent le **socle analytique** pour la **Phase 2** (Analyse Prédictive 2025) qui développe des modèles 
de régression et outils d'aide à la décision pour l'agence.

## Méthodologie

### Outils Utilisés
- **Langage** : R
- **IDE** : RStudio
- **Packages** : `base`, `stats`, `graphics`
- **Reporting** : Quarto / RMarkdown

### Techniques Statistiques

#### 1. Statistiques Descriptives
```r
# Calcul du prix au m²
don$prix_m2 <- don$prix / don$sup

# Résumé statistique
summary(don$prix_m2)
sd(don$prix_m2)
```

#### 2. Analyse Comparative (t-test)
```r
# Test de comparaison maisons vs appartements
t.test(prix_m2 ~ type, data = don)
```

**Résultat** : p-value < 0,001 (différence très significative)

#### 3. Agrégations & Comparaisons
```r
# Prix médian par commune et type
moyennes <- aggregate(prix_m2_agence ~ com_nom + type, 
                     data = base, 
                     FUN = median, 
                     na.rm = TRUE)
```

#### 4. Analyse Temporelle
```r
# Séparation avant/pendant COVID
avant_covid <- don[don$ann < 2020, ]
pendant_covid <- don[don$ann >= 2020, ]

# Calcul des médianes
aggregate(prix_m2 ~ type, data = avant_covid, FUN = median)
aggregate(prix_m2 ~ type, data = pendant_covid, FUN = median)
```

---

##  Visualisations Créées

### Graphiques Principaux

1. **Barplot** : Répartition maisons vs appartements
2. **Histogramme** : Distribution des prix au m²
3. **Boxplot** : Comparaison prix maisons vs appartements
4. **Barplots comparatifs** : Antony vs autres communes (maisons & appartements)
5. **Graphique temporel** : Évolution prix au m² 2017-2021 (2 courbes)

### Exemple de Code Visualisation
```r
# Boxplot comparatif
boxplot(don$prix_m2 ~ don$type, 
        data = don,
        horizontal = TRUE,
        main = "Comparaison des prix au m²\nMaisons vs Appartements",
        xlab = "Prix au m² (€)",
        ylab = "Type de bien",
        col = c("lightgreen", "lightcoral"))
```
---

##  Contenu du Dossier
```
partie1_situation_globale_2017_2021/
├── README_projet1.md              # Ce fichier
├── data/
│   └── DVF.RDS                    # Base données 2017-2021
├── images                         # Photo ville Antony
├── rapport_2017-2021.qmd          # Code source Quarto
└── rapport_2017-2021.html         # Rapport HTML final 
```
---

##  Contact

**Fatoumata Diallo**  
Email :fatimediallo111@gmail.com

---
*Dernière mise à jour : Janvier 2026*
---
