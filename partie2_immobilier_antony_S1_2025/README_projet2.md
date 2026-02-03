# Projet 2 : Analyse Prédictive du Marché Immobilier d'Antony (S1 2025)

> Modélisation statistique et outils d'aide à la décision pour l'agence Piazza Margherita


---

## Contexte du Projet

Cette seconde phase d'analyse constitue une **étude à finalité opérationnelle** commandée par Margherita Piazza (PDG de l'agence Piazza Margherita).
 L'objectif est de créer des **outils prédictifs** permettant aux conseillers de sélectionner rapidement les biens adaptés aux budgets et besoins des clients.

**Commanditaire** : Margherita Piazza (PDG)  
**Analyste** : Fatoumata Diallo  
**Date de publication** : 25 novembre 2025  
**Type** : Rapport confidentiel opérationnel  

---

##  Objectifs de l'Étude

### Objectifs Stratégiques

1. **Segmenter le marché** par taille de logement (petits, standard, grands)
2. **Créer un guide budget-client** opérationnel pour les conseillers
3. **Développer des modèles prédictifs** Surface = f(Prix) par type de bien
4. **Construire un modèle global** Prix = f(Superficie, Pièces, Type)
5. **Fournir des recommandations** personnalisées selon les budgets

### Livrables Attendus

Guide des prix par taille et type de bien  
Tableaux de correspondance budget → logement  
 Modèles de régression testés et validés  
Outils de prédiction pour conseillers  
Recommandations d'amélioration  

---

##  Données Utilisées

### Source
**DVF (Demandes de Valeurs Foncières)** - S1 2025 - 

### Caractéristiques
- **Période** : 1er semestre 2025 (janvier-juin)
- **Volume** : 270 transactions immobilières
- **Périmètre** : Commune d'Antony (code INSEE : 92002)
- **Fichier** : `data/DVF2025_S1.RDS`

### Variables Analysées
```
- type : Type de bien (Maison / Appartement)
- prix : Prix de vente (€)
- sup : Superficie (m²)
- nbp : Nombre de pièces
- prix_m2 : Prix au m² (calculé)
```

---

## Résultats Clés - Vue d'Ensemble S1 2025

###  Marché Global

| Indicateur                 | Valeur                 |
|----------------------------|------------------------|
| **Total transactions**     | 270                    |
| **Appartements**           | 194 (72%)              |
| **Maisons**                | 76 (28%)               |
| **Prix médian global**     | 380 000 €              |
| **Superficie médiane**     | 71 m²                  |
| **Nombre de pièces moyen** | 3,4                    |
| **Fourchette prix**        | 76 500 € - 1 345 000 € |

###  Prix Moyens par Type

| Type             | Prix Moyen            | Part Marché |
|------------------|-----------------------|-------------|
| **Appartements** | 340 313 €             | 72%         |
| **Maisons**      | 606 520 €             | 28%         |
| **Écart**        | **+266 207 € (+78%)** | -           |

**Insight** : Confirmation du marché à deux vitesses - Les maisons bénéficient d'une prime très élevée due à leur rareté.

---

## PARTIE B : Segmentation par Taille de Logement

###  Vue d'Ensemble des 3 Segments

| Segment             | Transactions | % Marché | Prix Médian Appart | Prix Médian Maison |
|---------------------|--------------|----------|--------------------|--------------------|
| **Petits (1-2p)**   | 57           | 21%      | 198 000 €          | 502 000 € (n=2)    |
| **Standard (3-4p)** | 160          | **59%**  | 359 000 €          | 530 000 €          |
| **Grands (5+p)**    | 53           | 20%      | 430 000 €          | 653 000 €          |

---

###  Segment 1 : Petits Logements (1-2 pièces)

**Volume** : 57 transactions (21% du marché)
- 55 appartements
- 2 maisons (offre quasi-inexistante)

#### Prix des Appartements

| Statistique | Valeur                |
|-------------|-----------------------|
| **Médiane** | 198 000 €             |
| **Q1-Q3**   | 163 000 € - 265 000 € |
| **Min-Max** | 76 500 € - 535 000 €  |

#### Recommandations Agence
```
Budget < 200k€    → Appartements 1-2p (cœur de marché)
Budget 200-250k€  → Appartements 2p ou petits 3p
Budget > 250k€    → Basculer vers 3p

 NE PAS promettre de maisons 1-2p (seulement 2 ventes/semestre)
```

---

### Segment 2 : Logements Standard (3-4 pièces)  CŒUR DE MARCHÉ

**Volume** : 160 transactions (**59% du marché** - segment dominant)
- 122 appartements (76%)
- 38 maisons (24%)

#### Prix des Appartements

| Statistique | Valeur                |
|-------------|-----------------------|
| **Médiane** | 359 000 €             |
| **Q1-Q3**   | 261 000 € - 482 000 € |
| **Moyenne** | 368 000 €             |

#### Prix des Maisons

| Statistique | Valeur                |
|-------------|-----------------------|
| **Médiane** | 530 000 €             |
| **Q1-Q3**   | 427 000 € - 626 000 € |
| **Moyenne** | 541 000 €             |

#### Différence de Prix
```
Écart médian : +171 000 € (+48%)
Test statistique : p < 0,001 (très hautement significatif)
Intervalle confiance : [104 000 € - 212 000 €]
```

**Conclusion** : À nombre de pièces égal, les maisons sont **structurellement plus chères** (+48%).

#### Recommandations Agence
```
Budget 250-400k€  → Appartements 3-4p (offre large : 122 biens)
Budget 400-550k€  → Zone transition (appart premium OU maison entrée)
Budget > 550k€    → Privilégier maisons 3-4p (meilleur rapport qualité/espace)

Segment le plus liquide - zone de confort commerciale
```

---

###  Segment 3 : Grands Logements (5+ pièces)

**Volume** : 53 transactions (20% du marché - segment premium)
- 17 appartements (32%)
- 36 maisons (68%)  **Inversion : maisons dominent**

#### Prix des Appartements

| Statistique | Valeur                |
|-------------|-----------------------|
| **Médiane** | 430 000 €             |
| **Q1-Q3**   | 255 000 € - 594 000 € |
| **Maximum** | 990 000 €             |

#### Prix des Maisons

| Statistique | Valeur                |
|-------------|-----------------------|
| **Médiane** | 653 000 €             |
| **Q1-Q3**   | 531 000 € - 863 000 € |
| **Maximum** | 1 345 000 €           |

#### Différence de Prix
```
Écart médian : +223 000 € (+52%)
Test statistique : p = 0,006 (très significatif)
Intervalle confiance : [65 000 € - 360 000 €]
```

#### Recommandations Agence
```
Budget 250-500k€  → Grands appartements exclusivement (offre limitée : 17 biens)
Budget 500-650k€  → Zone transition (arbitrage praticité vs jardin)
Budget > 650k€    → Privilégier maisons (dominent le segment : 36 biens)

 Segment haut de gamme - grandes familles aisées
```

---

##  SYNTHÈSE : Guide Opérationnel Budget-Client

### Tableau Récapitulatif Prix par Taille

| Taille   | Appart N | Appart Médiane | Appart Q1-Q3 | Maison N | Maison Médiane | Maison Q1-Q3 |
|----------|----------|----------------|--------------|----------|----------------|--------------|
| **1-2p** | 55       | 198k€          | 149-280k     | 2        | Insuf.         | Insuf.       |
| **3-4p** | 122      | 359k€          | 261-482k     | 38       | 530k€          | 427-626k     |
| **5+p**  | 17       | 430k€          | 255-594k     | 36       | 653k€          | 531-863k     |

### Guide Décisionnel par Budget

| Budget Client | Appartements                  | Maisons                      | Conseil Conseiller                     |
|---------------|-------------------------------|------------------------------|----------------------------------------|
| **< 200k€**   | 1-2p (rares)                  | Quasi inexistant             | Orienter vers appartements 1-2p        |
| **200-300k€** | 1-2p (courant)                | Quasi inexistant             | Appartements 1-2p ou petits 3p         |
| **300-400k€** | 3-4p (entrée)                 | Rares opportunités           | Appartements 3-4p - **offre large**    |
| **400-500k€** | 3-4p (courant), 5+p (rares)   | 3-4p (entrée)                | Choix appart 4p OU maison 3p           |
| **500-650k€** | 3-4p (premium), 5+p (courant) | 3-4p (courant)               | **Zone transition** - 2 options viables|
| **650-850k€** | 5+p (premium)                 | 3-4p (premium), 5+p (courant)| Privilégier maisons - meilleur rapport |
| **> 850k€**   | 5+p (exception)               | 5+p (premium)                | Segment premium - maisons dominantes   |

---

##  PARTIE C : Modèles Prédictifs Surface = f(Prix)

###  Modèle 1 : Maisons

#### Équation du Modèle
```
Surface (m²) = 31,5 + 0,000119 × Prix (€)
```

#### Qualité du Modèle

| Indicateur              | Valeur    | Interprétation                     |
|------------------------ |-----------|------------------------------------|
| **R²**                  | 0,345     | Pouvoir prédictif modéré           |
| **Corrélation Pearson** | 0,587     | Relation positive modérée          |
| **Corrélation Spearman**| 0,499     | Relation non parfaitement linéaire |
| **Significativité**     | p < 0,001 | Très hautement significatif        |
| **Écart-type résiduel** | 36,5 m²   | Forte variabilité                  |

#### Rendement Surface/Prix
```
+100 000 € → +12 m²
1 m² ≈ 8 400 €
```

#### Exemple : Client Budget 600 000 €

**Prédiction** :
```
Surface prévue : 103 m²
Intervalle confiance 95% : [95 - 111 m²]
```

**Conseils au Client** :
-  Privilégier quartiers moins centraux (plus de surface)
-  Accepter travaux rénovation (maisons anciennes plus spacieuses)
-  Considérer plain-pied terrain modeste

**Limites** : Forte variabilité selon terrain, étages, état, localisation.

---

###  Modèle 2 : Appartements

#### Équation du Modèle
```
Surface (m²) = 27,8 + 0,000111 × Prix (€)
```

#### Qualité du Modèle

| Indicateur              | Valeur    | Interprétation            |
|-------------------------|-----------|---------------------------|
| **R²**                  | 0,596     | **Bon pouvoir prédictif** |
| **Corrélation Pearson** | 0,772     | **Relation forte**        |
| **Corrélation Spearman**| 0,773     | Relation très linéaire    |
| **Significativité**     | p < 0,001 | Extrêmement significatif  |
| **Écart-type résiduel** | 14,5 m²   | **Faible variabilité**    |

#### Rendement Surface/Prix
```
+100 000 € → +11 m²
1 m² ≈ 9 000 €
```

#### Exemple : Client Budget 200 000 €

**Prédiction** :
```
Surface prévue : 50 m²
Intervalle confiance 95% : [47 - 53 m²]
```

**Ce budget correspond à** :
- Grand studio 35-40 m² (excellent état, bien situé)
- 2 pièces standard 45-55 m² (immeuble classique)
- Petit 3 pièces 50-60 m² (travaux ou excentré)

**Conseils d'Optimisation** :
- Derniers étages sans ascenseur (prix m² plus bas)
- Accepter absence parking (gain 15-20k€ réinvestissable)
- Comparer quartiers (écarts = 5-10 m² supplémentaires)

---

###  Comparaison des 2 Modèles

| Caractéristique        | Appartements| Maisons     | Écart     |
|------------------------|-------------|-------------|-----------|
| **R²**                 | **0,60**    | 0,34        | **×1,76** |
| **Corrélation**        | **0,77**    | 0,59 | +30% |
| **Écart-type résiduel**| **14,5 m²** | 36,5 m²     | **×2,5**  |
| **Surface/100k€**      | 11,1 m²     | 11,9 m²     | +7%       |
| **Prix/m²**            | ~9 000 €    | ~8 400 €    | -7%       |

#### Enseignements Clés

**1. Appartements = Marché Transparent**
- Prix prédit **2× mieux** la surface (R² 0,60 vs 0,34)
- Biens **standardisés** : à prix égal, surface varie peu
- **Prédictions fiables** pour conseillers

**2. Maisons = Marché Complexe**
- **Forte hétérogénéité** : terrain, configuration, étages
- Prix intègre facteurs au-delà de la surface
- Prédictions **indicatives** uniquement

**3. Rendement Surface/Prix Quasi-Identique**
- Contrairement aux idées reçues : seulement **7% de plus** en maison
- À budget égal, surface similaire (maison vs appartement)

---

### Exemple Concret : Client Budget 400 000 €

#### Option 1 : Appartement
```
Surface prévue : 72 m² [69-75 m²]
Profil type : 3-4 pièces, immeuble standard
```

**Points Forts** :
- Prédiction fiable (±3 m²)
- Charges réduites, entretien mutualisé
- Bonne liquidité revente

**Points Faibles** :
- Pas d'espace extérieur privatif
- Vie en collectif

#### Option 2 : Maison
```
Surface prévue : 79 m² [72-86 m²]
Profil type : Petite maison 3-4p avec jardin
```

**Points Forts** :
-  Jardin privatif
-  Indépendance
-  Potentiel extension

**Points Faibles** :
-  Charges et entretien élevés
-  Forte variabilité (±7 m²)
- Offre limitée

#### Recommandation

**Zone charnière** : Les 2 options viables, arbitrage selon mode de vie.

**Privilégier APPARTEMENT si** :
- Recherche sécurité/prédictibilité
- Praticité (pas entretien extérieur)
- Jeune actif ou investisseur

**Privilégier MAISON si** :
- Jardin = priorité absolue
- Acceptation incertitude
- Projet travaux/extension

---

##  PARTIE D : Modèle de Régression Multiple

### Modèle Global
```
Prix = a0 + a1×Superficie + a2×Nb_Pièces + a3×Type_Maison
```

### Coefficients du Modèle

| Variable             | Coefficient | Interprétation          | p-value     |
|----------------------|-------------|-------------------------|-------------|
| **Intercept (a0)**   | 87 344 €    | Prix de base (théorique)| -           |
| **Superficie (a1)**  | 3 941 €/m²  | Prix unitaire du m²     | < 0,001 *** |
| **Nb Pièces (a2)**   | -1 843 €    | **Non significatif**    | 0,88 NS     |
| **Type Maison (a3)** | 118 504 €   | Prime maison            | < 0,001 *** |

### Qualité du Modèle
```
R² = 0,618 (61,8%)
F-statistic : p < 0,001 (très significatif)
Variables significatives : Superficie *** + Type Maison ***
Variable non significative : Nb Pièces NS
```

#### Interprétation

**1. Superficie = Variable Clé**
- Chaque m² supplémentaire = **+3 941 €**
- Impact direct et hautement significatif

**2. Type Maison = Prime Structurelle**
- À surface égale, maison = **+118 500 €** vs appartement
- Reflète valeur terrain + jardin + indépendance

**3. Nombre de Pièces = Non Pertinent**
- Une fois superficie connue, découpage en pièces n'apporte rien
- Ce qui compte = surface totale, pas comment elle est divisée

---

### Exemple de Prédiction

**Client : Maison 100 m², 4 pièces**
```
Prix = 87 344 + (3 941 × 100) + (-1 843 × 4) + 118 504
Prix = 592 576 € ≈ 593 000 €
```

#### Validation

**Cohérence avec marché observé** :
- Prix médian maisons 3-4p : 530 000 € (notre bien plus grand)
- Prix médian maisons 5+p : 653 000 € (notre bien plus petit)
- **100 m² se situe logiquement entre les deux** 

---

### Variables Supplémentaires Proposées

#### Disponibles dans DVF

1. **Distance gare (dist_gare)** : Effet localisation
2. **Coordonnées GPS (X, Y)** : Distinction quartiers premium

#### Non Disponibles (Améliorations Futures)

| Variable                     | Impact Prix   | Difficulté Collecte |
|------------------------------|---------------|---------------------|
| **État du bien**             | +++++         | Moyenne             |
| **Année construction**       | ++++          | Facile              |
| **Étage (appart)**           | +++           | Facile              |
| **Ascenseur**                | +++           | Facile              |
| **Surface terrain (maison)** | +++++         | Moyenne             |
| **Nb salles bain/WC**        | +++           | Moyenne             |
| **Parking/Garage**           | ++++ (15-25k€)| Facile              |
| **Balcon/Terrasse**          | +++           | Moyenne             |
| **Exposition**               | +++           | Difficile           |
| **Vue**                      | ++++          | Difficile           |


---


## Visualisations Créées

### Graphiques Principaux

1. **Barplots** : Répartition types de biens
2. **Histogrammes** : Distribution prix, superficies, nb pièces
3. **Boxplots** : Comparaisons prix par type et taille
4. **Nuages de points + droites régression** : Modèles prédictifs
5. **Graphiques diagnostiques** : Validation modèles (résidus, QQ-plots)

---

## Insights Business & Recommandations

### Pour les Conseillers Immobiliers

#### Outil 1 : Guide Budget-Client (À Imprimer)

**Usage** : Lors du 1er contact client, déterminer rapidement le type de bien à proposer.
```
Client budget 350k€ ?
→ Regarder tableau page XX
→ Appartement 3-4p (cœur de marché)
→ Filtrer base : 3-4p, 250-450k€
```

#### Outil 2 : Calculateur Surface

**Usage** : Répondre à "Quelle surface puis-je avoir avec mon budget ?"
```
Client budget 450k€, veut appartement ?
→ Modèle : 27,8 + 0,000111 × 450000
→ Surface ≈ 77 m² [74-80 m²]
```

#### Outil 3 : Calculateur Prix

**Usage** : Estimer rapidement prix d'un bien
```
Maison 120 m², 5p ?
→ Prix = 87344 + (3941×120) + 118504
→ Prix ≈ 678 000 € (hors nb pièces)
```

---

### Pour la Direction

#### Opportunités Identifiées

**1. Segment 3-4p = Cœur de Marché**
- 59% des transactions (160 ventes)
- Offre abondante (122 appart + 38 maisons)
- **Action** : Renforcer acquisition biens 3-4p

**2. Segment 5+p = Premium Rentable**
- 20% des transactions, maisons dominent (68%)
- Prix médian 653k€ (marges élevées)
- **Action** : Développer réseau propriétaires grandes maisons

**3. Modèles Prédictifs = Avantage Concurrentiel**
- Réponses immédiates clients
- Crédibilité renforcée (approche data)
- **Action** : Former conseillers aux outils

**4. Maisons 1-2p = Ne PAS Promettre**
- Seulement 2 ventes/semestre
- **Action** : Ne pas faire de recherches actives sur ce segment

---

### Recommandations Stratégiques

**Court Terme (3 mois)** :
1. Imprimer guide budget-client pour tous conseillers
2. Créer calculateurs Excel basés sur modèles
3. Session formation équipe sur utilisation outils

**Moyen Terme (6 mois)** :
1. Enrichir base données (parking, état, étage)
2. Affiner modèles avec nouvelles variables
3. Développer tableau de bord Power BI

**Long Terme (12 mois)** :
1. Développer application web prédictive clients
2. Automatiser estimation biens (API)
3. Benchmark concurrence sur données

```

 
---

### Conclusion du Projet 2

Cette phase d'analyse prédictive a permis de développer des **outils opérationnels concrets** pour l'agence Piazza Margherita :

## Livrables Finaux

1. **Guide Budget-Client** : Tableau de correspondance budget → logement (immédiatement utilisable)
2. **Modèles Prédictifs** : 3 modèles de régression testés et validés (R² jusqu'à 0,62)
3. **Calculateurs Surface/Prix** : Formules simples pour conseillers
4. **Recommandations Segmentées** : Par taille de logement et budget

## Valeur Ajoutée

 **Gain de temps** : Présélection biens en <2 min  
 **Crédibilité renforcée** : Approche data-driven face aux clients  
 **Décisions éclairées** : Outils objectifs d'aide à la décision  
 **Avantage concurrentiel** : Rares agences avec modèles prédictifs  

```
---

##  Méthodologie


#### Langage & Packages
```r
- R 
- RStudio
- Packages : base, stats, graphics
- Reporting : Quarto
```

#### Techniques Statistiques Utilisées

**1. Statistiques Descriptives**
```r
summary(don$prix)
aggregate(prix ~ type + nbp, data = don, FUN = median)
```

**2. Tests d'Hypothèses**
```r
# Test t de Student
t.test(prix ~ type, data = standard)

# Test de Wilcoxon (non-paramétrique)
wilcox.test(prix ~ type, data = grands)
```

**3. Régression Linéaire Simple**
```r
# Modèle appartements
modele_appart <- lm(sup ~ prix, data = appartements)
summary(modele_appart)

# Prédiction
predict(modele_appart, newdata = data.frame(prix = 200000),
        interval = "confidence", level = 0.95)
```

**4. Régression Linéaire Multiple**
```r
# Modèle complet
modfin <- lm(prix ~ sup + nbp + type, data = don)
summary(modfin)
```

**5. Corrélations**
```r
cor(prix, sup, method = "pearson")
cor.test(prix, sup)
cor.test(prix, sup, method = "spearman")
```

 ---
##  Contenu du Dossier
```
Partie2_immobilier_antony_S1_2025
├── README_projet2.md             # Ce fichier
├── data/
│   └── DVF2025_S1.RDS            # Base S1 2025
├── images                        # Logo agence
├── rapport_2025.qmd              # Code source Quarto
└── rapport_2025.html             # Rapport HTML final 
---
##  [Simulateur](https://fatoumatadiallo2004.shinyapps.io/antony/)
---
##  Contact

**Fatoumata Diallo**  
  Email ::fatimediallo111@gmail.com  

---
*Dernière mise à jour : Janvier 2026*
---