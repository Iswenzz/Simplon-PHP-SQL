# Edirol

1. Schema de base de données :  

    type_produit (__num_type_produit__, libelle_type_produit)  
        clé primaire : num_type_produit  

    produit (__ref_produit__, libelle1_produit, libelle2_produit, nouveaute_produit, #num_type_produit)  
        clé primaire : ref_produit  
        clé étrangère : num_type_produit en référence à num_type_produit de la table type_produit  

    ville (__num_ville__, libelle_ville, nb_habitant)  
        clé primaire : num_ville  

    revendeur (__num_revendeur__, libelle_revendeur, CA, date_ouverture_magasin, #num_ville)  
        clé primaire : num_revendeur  
        clé étrangère : num_ville en référence à num_ville de la table ville  

    approvisionner (#ref_produit, #num_revendeur, date_approvisionnement, quantite)  
        clé primaire : ref_produit, num_revendeur, date_approvisionnement  
        clé étrangère : ref_produit en référence à ref_produit de la table produit  
        clé étrangère : num_revendeur en référence à num_revendeur de la table revendeur 

# Partie 1

1. Ajout des produits.

    Certains produits sont manquants et il vous est demandé de les ajouter. Les produits manquants sont les suivants : Le clavier PCR-M30, les enceintes MA-7A et le module sonore SD-90.

    Voir la capture d'ecran 'table_produit.png' pour avoir les infos des produits à ajouter.
    
    Il vous est aussi demandé de prendre en compte le fait que certains de ces produits ont déjà été commandés par quelques revendeurs. Le clavier PCR-M30 et le module sonore SD-90 n'ont pas encore été commandés.

    Les approvisionnements en enceintes MA-7A

    | Revendeur               | Date d'approvisionnement | Quantité |
    |-------------------------|--------------------------|----------|
    | Direct Music à Paris    | 10 mars 2005             | 10       |
    | Music Lab à Toulouse    | 26 mars 2007             | 10       |
    | MusicShow à Paris       | 20 août 2005             | 10       |
    | Massena Musique à Lille | 21 août 2006             | 20       |
    | Jericho à Bordeaux      | 25 avril 2007            | 40       |

2. La table type_produit.

    La table type_produit est manquante ! Ajouter-la ! La clé primaire doit être auto incrémentée et tous les libellés
    des types de produits doivent obligatoirement être renseignés et être uniques. Les informations sur les types de
    produits sont à récupérer à partir des copies d'écran.

3. Le lien entre les produits et les types de produit.

    Les tables produit et type_produit sont pour l'instant indépendantes. Faîtes les modifications nécessaires afin de les relier.

4. Les revendeurs.

    Le magasin Music Lab de la ville de Bordeaux a été omis. Ajouter-le sachant qu'il est ouvert depuis le 23 octobre 2004 et que son chiffre d'affaire est de 2 200 500 euros.

5. L'approvisionnement en produits du magasin bordelais Music Lab.

    Le magasin bordelais Music Lab s'est approvisionné plusieurs fois en produits et il vous est demandé d'intégrer ces informations dans la base de données.

    Les approvisionnements du magasin bordelais Music Lab

    | Date d'approvisionnement | Produits                  |
    |--------------------------|---------------------------|
    | 22 août 2004             | 15 mixeurs audio M-10E    |
    | 29 septembre 2004        | 15 interfaces MIDI UM-2C  |
    | 12 avril 2005            | 80 interfaces MIDI UM-1X  |
    | 12 avril 2005            | 80 interfaces MIDI UM-1SX |

6. Renommer la table approvisionnement.

    Suite à une erreur d'inattention, le libellé de la table mémorisant l'approvisionnementdes revendeurs en produits est erroné. La table doit en fait s'appeler approvisionner. Rectifier cette erreur...

7. La date d'ouverture du magasin parisien Music Center.

    La date d'ouverture du magasin parisien Music Center est erronée. En fait, ce magasin a ouvert le 01 juillet 2000.
    Rectifier cette erreur...

8. La suppression en cascade de l'approvisionnement si on supprime un revendeur.

    Le gestionnaire souhaiterait que la suppression d'un revendeur (en cas de dépôt de bilan par exemple) entraîne automatiquement la suppression des enregistrements liés dans la table des approvisionnements. Réaliser les modifications nécessaires...

9. Le nombre d'habitants des différentes villes référencées.

    Le gestionnaire souhaiterait que le nombre d'habitants des différentes villes référencées dans la base de données soit connu afin de pouvoir réaliser des statistiques quant aux produits commandés par les différents revendeurs en fonction de l'importance de la ville.

    Il vous est donc demandé d'intégrer cette information dans la base de données.
    Les différentes villes référencées

    | Ville     | Population          |
    |-----------|---------------------|
    | Lille     | 1 200 000 habitants |
    | Paris     | 4 500 000 habitants |
    | Marseille | 1 500 000 habitants |
    | Toulouse  | 500 000 habitants   |
    | Bordeaux  | 670 000 habitants   |

10. La suppression des produits

    Les modules sonores de type SD (SD-20, SD-80 et SD-90) vont disparaître du catalogue. Supprimer les.

# Partie 2

Ecrire les requetes SQL qui permet d'afficher : 

1. La référence des nouveaux produits triés par référence décroissante.

2. Le libellé et la ville des revendeurs ayant réalisés un chiffre d’affaire supérieur ou égal à 2 000 000 euros. Les enregistrements seront triés d’après le libellé croissant des revendeurs (si plusieurs revendeurs possèdent le même libellé, ils seront alors triés d’après le libellé croissant de leur ville d’appartenance).

3. La référence et le premier libellé de tous les claviers et de tous les modules sonores.

4. La référence et le premier libellé de tous les produits commandés durant l’année 2004 par le magasin Direct Music de Paris.

5. Les villes où l’enseigne Music Center est implantée.

6. La référence des produits dont la référence comporte un tiret (-) en quatrième position et se terminant par le chiffre zéro (0).  Exemple : le produit PCR-A30.

7. Les magasins ( le libellé et la ville des revendeurs) ayant commandés le module sonore SD-20 en 2004.

8. Les différents types de produits commandés par les distributeurs Lillois.

9. Le libellé des revendeurs situés dans la même ville que le magasin Destroy Decibel.

10. Le libellé des villes qui sont plus peuplées que la ville de Lille.

# Partie 3

### Les fonctions de groupe

Ecrire les requêtes SQL permettant d’afficher :

1. Le nombre de produits présents au catalogue.

2. Le chiffre d’affaire total réalisé par les revendeurs parisiens.

3. La ville la plus peuplée.

4. Le nombre d’interfaces USB UA-1000 commandés en 2005.

5. Les revendeurs (de toutes les villes sauf Marseille) dont le chiffre d’affaire est compris entre le plus petit et le plus grand chiffre d’affaire réalisé par les magasins marseillais. Vous trierez les résultats d’après le chiffre d’affaire croissant des revendeurs.

6. Les revendeurs les plus anciens pour chaque enseigne ( le plus ancien revendeur Music Show, le plus ancien revendeur MusicLab, ...). Les revendeurs seront triés par libellé croissant.

7. Pour chaque type de produit, présentez le nombre de nouveautés.

8. Le nombre de revendeurs implantés dans chaque ville de plus d'un million d'habitants. Les enregistrements seront triés d'après le nombre décroissant de revendeurs par ville.

9. Pour chaque enseigne, afficher le nombre de revendeurs ainsi que le chiffre d'affaire moyen de ces revendeurs, le chiffre d'affaire le plus important et le chiffre d'affaire le plus faible. Les enregistrements devront être triés d'après le chiffre d'affaire moyen décroissant des enseignes.

10. Pour les claviers et les interfaces midi, présenter le nombre de revendeurs par ville qui ont commandés ces types de produits en 2004 et 2005. Les enregistrements seront triés en fonction du libellé croissant du type de produit et, pour les enregistrements présentant le même libellé, par le nombre décroissant de revendeurs.

11. Pour les revendeurs ayant au moins 2 magasins, présenter le chiffre d’affaire moyen par revendeur seulement si, pour ces revendeurs, le chiffre d’affaire du meilleur magasin ne dépasse pas le double du chiffre d’affaire du moins bon magasin.

### Les sous-requêtes

Ecrire les requêtes SQL permettant d’afficher :

1. Les revendeurs qui ne sont pas implantés dans une ville de plus d’un million d’habitant.

2. Les revendeurs qui ont réalisés un plus gros chiffre d’affaire que tous les revendeurs de Bordeaux.

3. Les revendeurs (hormis ceux de l’enseigne Direct Music) dont le chiffre d’affaire est plus élevé que celui d’un des magasins (peu importe lequel) de l’enseigne Direct Music.

4. Les revendeurs qui n’ont jamais commandés les produits 'PCR-M50','PCR-M80' et 'SD-20'.

5. Les revendeurs (leur nom, leur ville et leur chiffre d’affaire) pour les revendeurs qui ont réalisé un meilleur chiffre d’affaire que le magasin Jericho de Lille mais un chiffre d’affaire moins important que le magasin Direct Music de Bordeaux. Les revendeurs seront classés d’après leur chiffre d’affaire décroissant.

6. Les villes (classés par libellé décroissant) où certains revendeurs se sont pas approvisionnés en tables de mixage audio.


