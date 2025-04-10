**Table des matières**

[0. Pour ceux qui ne lisent pas les manuels
1](#pour-ceux-qui-ne-lisent-pas-les-manuels)

[1. Préambule 2](#préambule)

[1.1. Contexte du développement de COOP
2](#contexte-du-développement-de-coop)

[1.2. Utilisations possibles de COOP 2](#utilisations-possibles-de-coop)

[121. Un objet de curiosité 2](#un-objet-de-curiosité)

[122. Bac à sable 2](#bac-à-sable)

[121. Socle pour une version de production
3](#socle-pour-une-version-de-production)

[1.3. Problèmes divers et bugs 3](#problèmes-divers-et-bugs)

[1.3.1. Internationalisation 3](#internationalisation)

[1.3.2. Bugs 4](#bugs)

[2. COOP structure générale 4](#coop-structure-générale)

[3. COOP approche modulaire 5](#coop-approche-modulaire)

[3.1. Principe général 5](#principe-général)

[3.2. Module simple 5](#module-simple)

[3.3. Module complexe 5](#module-complexe)

[3.4. Dépendance entre les modules 5](#dépendance-entre-les-modules)

[3.5. Clonage des modules 6](#clonage-des-modules)

[4. Droits Permissions Privilèges des utilisateurs
6](#droits-permissions-privilèges-des-utilisateurs)

[4.1. Permissions CRUD 6](#permissions-crud)

[4.2. Permissions Niveaux et Groupes 7](#permissions-niveaux-et-groupes)

[4.3.Principe de distribution des droits sur les différents modules
7](#principe-de-distribution-des-droits-sur-les-différents-modules)

[5. Dossiers et fichiers 8](#dossiers-et-fichiers)

[5.1. Nommage des dossiers 8](#nommage-des-dossiers)

[5.2. Nommage des fichiers 8](#nommage-des-fichiers)

[5.3. Contenu des dossiers 8](#contenu-des-dossiers)

[5.4. Contenu des fichiers 9](#contenu-des-fichiers)

[6. Structures des tables 9](#structures-des-tables)

[6.1. Nommage des tables et des colonnes
9](#nommage-des-tables-et-des-colonnes)

[6.2. Structures des tables 10](#structures-des-tables-1)

[7. Volet « corporate » et « community »
10](#volet-corporate-et-community)

[8. PRM : Project Relationship Management
11](#prm-project-relationship-management)

[9. Module Projet 11](#module-projet)

[9.1. Module Projet : orientation générale
11](#module-projet-orientation-générale)

[9.2. Module Projet : fonctionnalités
12](#module-projet-fonctionnalités)

[9.2.1. Pilotage du projet 12](#pilotage-du-projet)

[9.2.2. Gestion du projet 12](#gestion-du-projet)

[9.3. Module Projet : structure 12](#module-projet-structure)

[9.4. Module Projet : gestion des droits
13](#module-projet-gestion-des-droits)

[9.5. Module Projet : trucs et astuces
13](#module-projet-trucs-et-astuces)

[10. Trucs et astuces 15](#trucs-et-astuces)

[10.0. Install CO-OP 15](#install-co-op)

[10.1. orga/orga_dept, place/place_space, building/building_room
15](#orgaorga_dept-placeplace_space-buildingbuilding_room)

[10.2. Forum, debug, chat 16](#forum-debug-chat)

[10.3. Liste de choix. Pattern 16](#liste-de-choix.-pattern)

[10.4. RSS 17](#rss)

[10.5 Purge des fichiers documents et images
17](#purge-des-fichiers-documents-et-images)

# 0. Pour ceux qui ne lisent pas les manuels

Vous pouvez directement découvrir le site web COOP soit comme simple
visiteur (non connecté) soit en utilisant successivement les différents
statuts possibles : viewer, editor, supervisor, admin.

L'installation de COOP est classique :

-   télécharger l'ensemble du dossier COOP depuis Github

-   coller ce dossier dans /var/www

-   libérer les droits d'écriture sur les sous dossiers ayant un préfixe
    « x\_ » (ils sont utilisés pour le téléchargement de documents ou
    d'images)

-   dans le terminal, se placer dans le dossier COOP : /var/www/coop

-   lancer SQLPage : /var/www/SQLPage/SQLPage.bin

-   dans votre navigateur se rendre à : http://localhost:8080/

-   commencer la visite.

**Pour changer de rôle, il suffit d'utiliser les identifiants
suivants :**

-   **viewer1@coopcoop.net**

-   **editor1@coopcoop.net**

-   **supervisor1@coopcoop.net**

-   **admin1@coopcoop.net**

**avec le mot de passe : CoopCoop1**

Vous pouvez créer de nouveaux utilisateurs, mais vous devrez passer
ensuite en mode « admin » pour fixer les droits des nouveaux
administrateurs.

Dans le panneau administrateur, vous trouverez un menu « Help Dev » avec
la documentation embarquée de COOP.

Pour compléter la démo, dans les panneaux d'administration admin,
supervisor et editor, vous trouvez les liens vers des flux RSS (voir le
principe de ces flux dans Help-Dev).

# 1. Préambule

## 1.1. Contexte du développement de COOP

COOP est le résultat d'un parcours d'apprentissage de sql via SQLPage
par un « no-pro » (le développement informatique n'est pas mon métier et
ma culture informatique est très limitée). L'objectif était de
développer un site web complet, fonctionnel, dynamique (tous les
contenus gérés à partir de tables). L'argument de cette base de données
est le suivi de chantiers de réhabilitation de bâtiments dans le cadre
de chantiers participatifs associant des professionnels et des
particuliers. Le suivi et la coordination de ces chantiers sont assurés
par des associations indépendantes organisées en réseau. Cela explique
le nom du site et le volet consacré au travail collaboratif (voir volet
C plus loin).

Le code de COOP est très simple : utilisation de SQLITE comme moteur de
gestion de base de données, requêtes SQL de base (requêtes
élémentaires : pas d'utilisation de triggers, pragma...), SQLPage socle
(pas de composants « custom », pas de scripts), une écriture des
requêtes très scolaire, des noms de fichiers et de dossiers très
explicites...

Il doit traîner des erreurs dans le schéma de la base de données et dans
l'écriture de certaines requêtes.

## 1.2. Utilisations possibles de COOP

### 121. Un objet de curiosité

COOP permet de voir une manière possible de construire un site web avec
SQLPage. Certains aspects peuvent constituer une source d'inspiration.
Cela complète les exemples mis en avant [dans la documentation
officielle de SQLPage](https://sql-page.com/documentation.sql) ou dans
des tutoriels comme [LearnSQLPage](http://learnsqlpage.com/).

### 122. Bac à sable

COOP est le résultat d'un parcours d'apprentissage ; il se prête bien à
une utilisation comme bac à sable pour d'autres « no-pro » souhaitant se
familiariser avec l'application SQLPage, le langage SQL et la conception
de site web pour accueillir une base de données spécifiques.

Le développement de COOP n'a impliqué que des logiciels libres et
gratuits (voir le menu 'nos sponsors' dans le site).

Les principales sources de documentation utilisées ont été :

-   [documentation SQLPage](https://sql-page.com/documentation.sql)

-   [espace de discussion
    SQLPage](https://github.com/sqlpage/SQLPage/discussions)

-   divers sites de tutoriels et forums centrés sur SQLITE, SQL, CSS...
    (**merci à tous les contributeurs!**)

-   et pour tester, un site gratuit d'IA . Le recours à l'IA est, à
    court terme, assez efficace, pour un débutant isolé, pour corriger
    la syntaxe de requêtes SQL ; toutefois il faut rester conscient du
    coût environnemental de l'IA et de sa dimension prédatrice, car elle
    se nourrit du travail de ceux qui rédigent des tutoriels ou
    fournissent des réponses sur les forums. Et, en efficacité réelle,
    il est finalement plus efficace de s'astreindre à suivre un cours
    complet sur le SQL ou acheter un ouvrage de référence que de devenir
    dépendant d'un moteur de recherche IA. L'IA appliquée au code
    informatique, c'est comparer la pizza surgelée à la pizza faite
    maison, c'est vite fait, cela présente bien mais au final c'est plus
    cher et pas forcément meilleur.

### 121. Socle pour une version de production

***Avertissement** : COOP est certes fonctionnel, mais il serait peu
prudent de l'employer pour une version de production. On peut en
utiliser, à la limite, des parties, par exemple, le volet A (voir COOP
structure générale) pour mettre en ligne une base de données maison.
Mais, avant d'envisager d'utiliser COOP en totalité ou en partie pour
une version de production, il faudrait d'abord en faire relire le code
et le schéma par un pro.*

Par ailleurs, pour des raisons de faciliter et d'apprentissage, COOP a
été développé sur sqlite. Or ce type de moteur de base de données n'est
pas optimum pour des connexions simultanées, ce qui est pourtant la
spécificité de COOP (voir plus loin les « community tools »). Pour une
version de production, il faudrait engager une migration vers
postgresql. Mais cette migration n'est pas triviale ,car elle
impliquerait :

-   revoir les formats des données (sqlite est assez simpliste sur cet
    aspect alors que postgresql est plus sophistiqué),

-   revoir certaines requêtes (json object...) car sqlite et postgresql
    ne respectent pas la même syntaxe

-   revoir le système de gestion des permissions (voir plus loin droits
    permissions privilèges) qui sont gérées au niveau des tables
    elles-mêmes dans postgresql.

Enfin, il faudrait tout de même intégrer quelques scripts pour assurer
certaines fonctions, par exemple, pour assurer  :

-   une authentification à double niveau,

-   la gestion des mots de passe oubliés,

-   l'envoi de mails et de notifications, ( *il semble possible
    d'implanter cette fonctionnalité (voir contribution
    <https://github.com/sqlpage/SQLPage/discussions/842> basée sur
    l'utilisation de la fonction sqlpage.fetch_with_meta)*.

-   le paramétrage des impressions,

-   la gestion des tâches de maintenance de la base.

## 1.3. Problèmes divers et bugs

### 1.3.1. Internationalisation

Je suis francophone et le contenu des *labels, contents, contents_md*...
est en français. SQLPage n'inclut pas, en version de base, de
fonctionnalité d'internationalisation (cela est envisageable via des
scripts). Mais tous les navigateurs web récents incluent des
fonctionnalités de traduction instantanée qui rendant inutile la
traduction des contenus en amont dans le code du site. Toutefois, les
listes de choix sont gérées à partir de 2 tables (choice_categories,
choice_items) ce qui facilite l'adaptation éventuelle de celles-ci.

Par contre, le parti a été pris de nommer les tables, les dossiers, les
fichiers en « globish » (global english aka broken english!) qui est la
norme dans les langages informatiques comme le sql, html, css, SQLPage,
... Cela permet une utilisation de COOP par des non francophones..

### 1.3.2. Bugs

Autant que possible COOP a été débogué, mais il doit subsister encore
ici et là des bugs. SQLPage inclut un moteur de vérification assez
efficace qui permet de localiser ceux-ci. Mais parfois on peut arriver
sur une page blanche. La cause est souvent liée soit à ;

-   un chemin incorrect

-   l'absence d'un argument type « myparemeter_id » dans un chemin
    (myfile.sql?myparameter_id='\|\|\$myparameter)

-   une requête dans une colonne contenant une valeur NULL.

# 2. COOP structure générale

Il existe de nombreuses applications commerciales ou open source,
no-code pour répondre aux besoins les plus classiques attendues d'un
site web . Mais il existe des cas où la structure de la base de données
est trop spécifique pour que l'on puisse utiliser une de ces
applications. Il faut donc construire le site web autour de la base de
données. C'est la finalité de SQLPage dont un gros atout est d'être une
application à « code simple » accessible à des personnes dont le
développement informatique n'est pas le cœur de métier mais qui ont
besoin de mettre en ligne une base de données spécifiques.

Mettre en ligne une base de données ne se limite pas à la mise en ligne
des données proprement dites. Il faut aussi assurer le développement des
autres fonctions périphériques attendues d'un site web :

-   **fonction « admin » **: administrer le site web : gérer des droits
    des utilisateurs, assurer la maintenance,

-   **fonction « corporate »** : présenter la structure éditrice du site
    web : qui nous sommes, quelles sont nos activités, présentation de
    notre équipe...

-   **fonction « contact » **: offrir une interface de contact et
    d'échange avec les visiteurs : formulaire de contact, formulaire
    d'inscription, FAQ...

-   **fonction « interface» **: offrir une interface pour alimenter et
    maintenir la base de données qui a justifié la création du site,

-   **fonction « community » **: offrir des outils collaboratifs pour
    les rédacteurs qui alimente la base de données ou produisent les
    contenus sur le site.

La structure de COOP, tente de répondre à toutes fonctions. Les dossiers
sont organisés d'une manière logique avec un système de repérage des
fonctions par des suffixes alphabétiques.

-   Le premier groupe couvre des fonctions non-spécifiques

    -   **groupe A suffixe /a\_ **: modules admin de gestion du site :
        sessions, users, infos, rss...

    -   **groupe B suffixe /b\_ **: modules corporate et contact avec
        les visiteurs 

    -   **groupe C suffixe /c\_** : modules community : forum, chat,
        wokspaces...

-   et un second groupe de dossiers spécifiques à COOP dont la
    thématique est la gestion de projets de réhabilitation accompagnée
    de logements (fonction interface) :

    -   **groupe D suffixe /d\_** : modules PRM (project relationship
        management)

    -   **groupe E suffixe /e\_** : modules PMS (project management
        system)

-   Enfin, les documents, images... sont regroupés dans des dossiers
    particuliers :

    -   **groupe X suffixe /x\_** : modules de stockage des documents.

Pour arriver à mettre en ligne une base de donnée spécifique (groupe D
et E), il faut assurer aussi le développement des autres volets et au
moins les modules du groupe A.

Par défaut, CO-OP offre l'ensemble des fonctionnalités.

Si l'on souhaite utiliser CO-OP uniquement pour de la gestion de projet
(groupe A, D, E), il suffit de :

-   renommer le dossier a_panels → a_panels_default

-   renommer le dossier a_panels_project → a_panels

-   renommer le dossier a_shells → a_panels_default

-   renommer le dossier a_shells_project → a_shells

Si l'on souhaite utiliser CO-OP uniquement pour de la gestion d'un site
internet associatif ou d'entreprise (groupe A, B, C), il suffit de :

-   renommer le dossier a_panels → a_panels_default

-   renommer le dossier a_panels_website → a_panels

-   renommer le dossier a_shells → a_panels_default

-   renommer le dossier a_shells_website→ a_shells

# 3. COOP approche modulaire

## 3.1. Principe général

Par module, on entend tous les éléments qui vont permettre de créer une
fonctionnalité particulière. Chaque volet A, B, C, D, E correspond à un
ensemble cohérent de modules.

## 3.2. Module simple

Un module simple est constitué de :

-   une table

-   un dossier simple (voir contenu des dossiers) contenant les fichiers
    permettant la création, l'édition, la publication et la suppression
    des données,

-   un lien dans la barre des menus

-   un lien dans le tableau d'administration des admins, des
    superviseurs ou des éditeurs suivant le cas

Exemple de module simple : **news** (dossier /b_news) qui permet la
publication d'articles soit sur le site public soit sur le site interne.

## 3.3. Module complexe

Un module complexe est constitué de :

-   plusieurs tables parfois liées par des contraintes (clés étrangères)

-   plusieurs dossiers contenant les fichiers permettant la création,
    l'édition, la publication et la suppression des données dans chaque
    table,

-   un lien dans la barre des menus

-   un lien dans le tableau d'administration des admins, des
    superviseurs ou des éditeurs suivant le cas

exemple de module complexe : **workspaces** (dossier /c_wokspaces) qui
associe des tables permettant la gestion d'un forum, de chat, de partage
de documents et d'organisation de réunions.

## 3.4. Dépendance entre les modules

Même pour les modules simples, il y a des liens de dépendance :

-   **tous les modules dépendent des modules du groupe A : users,
    sessions, shells, panels, info**

-   il y a des liens de dépendance entre certains modules à l'intérieur
    du groupe B (exemple : les tables members, orga_dept, events, place,
    place_space dépendent de orga)

-   il y a des liens de dépendance entre certains modules du groupe C
    avec des tables du groupe B (meetings et workmeetings, dépendent ,
    place_space donc d'orga et orga-dept)

-   les modules du groupe D ne dépendent que des modules socles du
    groupe A

-   les modules du groupe E dépendent des modules du groupe D et des
    modules socles du groupe A

On peut visualiser les liens de dépendances en parcourant les tables
pour repérer les références à une table externe souvent (mais pas
toujours) à une clé étrangère.

La suppression de certains enregistrements d'une table impliquent la
suppression des enregistrements liés dans d'autres tables. Dans ce cas
de figure, dans COOP, un message d'alerte est systématiquement affiché
avant la suppression d'un enregistrement parent. Un champ
« my_table_status » a été introduit dans la plupart des tables. Il
permet d'archiver un enregistrement plutôt que de le supprimer. Pour les
tables de type users, members... il est prévu une anonymisation des
données qui peut être utilisée quand une personne demande la suppression
de ses données personnelles dans la base de données.

## 3.5. Clonage des modules

Si l'on respecte une certaine constance dans le nommage des tables, des
colonnes, des dossiers et des fichiers, il est possible de créer un
nouveau module, par une succession de copie/coller/renommer à partir de
la structure d'un module de référence. Cela n'évite pas un travail de
codage si l'on ajoute ou l'on retire des colonnes à certaines tables
mais cela permet de gagner un temps certain sur le codage général du
module.

# 4. Droits Permissions Privilèges des utilisateurs

## 4.1. Permissions CRUD

COOP distingue plusieurs rôles pour les utilisateurs connectés :

-   **viewer** : ce rôle permet d'accéder à la lecture des informations
    internes (news, agenda, FAQ) et de poster dans le forum

-   **editor **: ce rôle permet de lire, créer et éditer des contenus

-   **supervisor **: ce rôle permet de lire, créer, éditer et supprimer
    des contenus

-   **admin **: ce rôle est surtout dédié à la gestion du site et il a
    surtout un pouvoir de contrôle sur les utilisateurs.

Les utilisateurs créent leur compte et leur mot de passe eux-mêmes. Par
défaut, ils n'ont aucun rôle. Leur niveau de permission sera décidé par
l'admin. Il n'y a donc à aucin moment de circulation des mots de passe
et ceux-ci ne sont pas stockés dans la base (seulement le
hash_password).

L'admin est informé qu'il y a une demande de création de compte via un
flux RSS dédié (/a_rss_feed/rss_new_users_5.sql).

Le filtrage d'accès aux fichiers sql est assuré au niveau d'un composant
« shell » spécifique :

-   /a_shells/shell_2.sql pour les viewers

-   /a_shells/shell_3.sql pour les éditeurs

-   /a_shells/shell_4.sql pour les superviseurs

-   /a_shells/shell_5.sql pour les admins

Chaque shell après vérification du rôle de l'utilisateur, appelle un
shell_core (/a_shells/shell_core.sql) qui va permettre l'affichage du
menu des permissions de l'utilisateur.

Pour se repérer facilement dans les fichiers en fonction des niveaux de
droits, le principe adopté est celui d'utiliser des suffixes à la fin du
nom du fichier :

-   /news_private_display_3.sql : fichier éditeur pour liste les news
    internes

-   /news_private_display_4.sql : fichier superviseur pour liste les
    news internes (identique au précédent mais avec une fonction DELETE
    en plus)

```{=html}
<!-- -->
```
-   Les fichiers avec un suffixe \_1₁ concernent des fichiers
    accessibles à tout utilisateur connecté (exemple :
    /a_panels/panel_user_1.sql pour l'actualisation du profil de
    l'utilisateur).

-   Les fichiers avec un suffixe \_0 concernent des fichiers de
    traitement intermédiaires (INSERT, UPDATE, DELETE) sans en tête.

-   Les fichiers sans suffixe concernent les fichiers liés aux visiteurs
    du site, non-connectés.(exemple :
    /var/www/SQLPage/b_about/orga_about.sql pour le menu « qui sommes
    nous ? »)

## 4.2. Permissions Niveaux et Groupes

COOP inclut la possibilité de gérer 2 autres types de permissions :

-   **niveau (L)** : permission d'accès à certains champs d'une table ou
    à une table fille particulière d'une table principale

-   **groupe**  **(G)**: permission sur tous les champs d'une table mais
    pour seulement une partie des données

Pour comprendre l'utilité possible de ces deux filtres, imaginons un
club sportif avec 2 sections : football et rugby :

-   on attribue une permission CRUD « viewer » aux adhérents, ils
    peuvent consulter les nouvelles internes, intervenir sur le forum...
    mais n'ont aucun accès sur les données concernant les joueurs

-   on attribue une permission CRUD « editor » aux coachs sportifs, aux
    soigneurs, aux comptables

-   on attribue une permission CRUD « supervisor » aux dirigeants, au
    médecin et au directeur financier.

-   On peut concevoir la table des données des joueurs de 2 manières :
    soit une table PLAYER avec des champs  : L1_player_sport_data,
    L2_player_medical_data, L3_player_financial_data ou une table
    principale PLAYER (player_id, player_name) et 3 tables liées :
    L1_SPORT (player_id, sport_data), L2_MEDICAL (player_id,
    medical_data), L3_FINANCIAL (player_id, financial_data). On attribue
    ensuite une permission L1 aux coachs sportifs, L2 aux soigneurs, L3
    aux comptables. Cela permet que chaque encadrant ne voit que les
    données qui le concernent (et cela évite que tout le monde ait accès
    aux données médicales ou financières sensibles).

-   Par ailleurs, on peut introduire un champ « group » dans chaque
    table avec comme valeur G1 pour le foot et G2 pour le rugby. Un
    coach G1 ne pourra consulter et éditer que les données de niveau 1
    (données sportives) pour les joueurs de foot. On peut mettre en
    place aussi des requêtes CREATE telle qu'un enregistrement créé par
    un coach G1 prendra automatiquement la valeur G1.

-   Pour les dirigeants on peut garder le filtre L (les données
    médicales ne sont visibles que par un médecin) mais on peut leur
    donner accès à tous les joueurs, avec des droits de suppression des
    données.

La combinaison des trois types de permissions (CRUD, L, G) permet de
couvrir un très grand nombre de cas de figures. Dans une entreprise, on
peut associer chaque service à un groupe, dans une école on peut créer
des combinaisons entre des classes et des niveaux...

## 4.3.Principe de distribution des droits sur les différents modules

Les droits sont répartis par volet :

-   modules du volet /a\_ : admin (5) *administration générale du site,
    gestion des utilisateurs, debug, ...*

-   modules du volet /b\_ superviseur (4) *contenus généraux,
    descriptions des organisations et des membres, validation des
    événements...*

-   modules du volets /c\_ : tous les utilisateurs connectés (1) avec
    une modération ultime de l'administrateur (5)

-   modules des volets /d\_ et /e\_ : les éditeurs (3) avec une
    modération des superviseurs (4)

COOP ne valorise pas les filtres L et G. Cela aurait pu être possible
sur les modules PRM et projet pour séparer les équipes ou affecter
certaines équipes à certains travaux ou encore répartir les équipes en
fonction de la localisation des bâtiments.

# 5. Dossiers et fichiers

## 5.1. Nommage des dossiers

Les dossiers regroupent les fichiers d'un même module ou sous module
(voir approche modulaire).

Le nommage des fichiers repose sur :

-   un suffixe qui permet de repérer le profil de l'utilisateur sans
    avoir à ouvrir le fichier (voir permissions CRUD)

-   un rappel du nom de la table

## 5.2. Nommage des fichiers

Le nommage des fichiers repose sur :

-   un terme qui évoque intuitivement la table associée au module,

-   un terme qui évoque le volet du module : main, archive, doc....,

-   un terme qui évoque la requête sql ou le composant SQLPage,

-   un préfixe en rappel de la section à laquelle le dossier se rattache
    (voir COOP structure générale).

Exemple :

-   **my_table_main_display_4.sql** → le fichier ne peut être ouvert que
    par un utilisateur ayant des droits de superviseur, il concerne la
    table/module « my_table », « main » signifie que l'on est sur le
    traitement central du module et display que la requête est soit un
    composant table ou list,

-   **my_table_archive_display_4.sql** → le fichier ne peut être ouvert
    que par un utilisateur ayant des droits de administrateur, il
    concerne la table/module « my_table », « archive» signifie que l'on
    est sur des colonnes où la valeur de
    « may_table_status »= »archived » et display que la requête est soit
    un composant

-   **my_table_main_create_0.sql** → le fichier est un fichier de
    traitement, sans en tête, avec une requête CREATE. il concerne la
    table/module « my_table ».

Cela conduit à des noms de chemins de fichiers assez lourds mais cela
rend la lecture assez intuitive (inutile d'ouvrir le fichier pour
connaître son contenu et son rôle) et cela évite les confusions
possibles entre des modules qui sont presque jumeaux (exemple les
modules forum et debug). Cela est donc surtout utile lors de la
conception du site web surtout si cette conception se déroule en mode
collaboratif.

La constance dans le nommage des fichiers facilite le clonage des
modules. Il suffit de conduire une série de copier/coller/renommer pour
créer un nouveau module à partir d'un module de référence.

## 5.3. Contenu des dossiers

Le dossier contient une série de fichiers que l'on peut désigner comme
le cœur du module et que l'on repère par le term « main ». Par exemple :

-   **my_table_main_display_4.sql :** la liste ou la table qui permet de
    visualiser les données de la table (le 4 indique que ce fichier en
    pourra être ouvert que par un superviseur avec une permission
    DELETE)

-   **my_table_main_display_3.sql :** la liste ou la table qui permet de
    visualiser les données de la table (le 4 indique que ce fichier en
    pourra être ouvert que par un éditeur avec une permission de
    lecture, création et modification)

-   **my_table_main_form_3.sql :** le formulaire qui permet de créer les
    données

-   **my_table_main_edit_3.sql :** le formulaire qui permet d'actualiser
    les données

-   **my_table_main_form_4.sql :** le formulaire qui permet de créer les
    données (le superviseur peut avoir accès à certains champs
    supplémentaires par rapport à l'éditeur. Par exemple, c'est lui qui
    maîtrise le champs « my_table_status » qui autorise la mise en ligne
    ou l'archivage d'un enregistrement).

-   **my_table_main_edit_4.sql :** le formulaire qui permet d'actualiser
    les données

-   **my_table_main_create_0.sql :** le traitement d'insertion des
    données dans la base

-   **my_table_main_update_0.sql :** le traitement d'insertion des
    données dans la base

-   **my_table_main_delete_0.sql :** le traitement qui permet
    l'effacement des données dans la base

Autour du cœur « main » du dossier, suivant la complexité du module, on
crée avec la même logique les fichiers liés aux fonctions secondaires :

-   **my_table_doc_display_4.sql :** si la fonction principale du module
    est la description d'une entreprise, les fichiers « doc » concernent
    le traitement des documents associés à chaque entreprise

On peut aussi avoir des fichiers pour des fonctionnalités
particulières :

-   **my_table_archive_display_4.sql :** viiualisation des données
    archivées

-   **my_table_anonym_0.sql :** traitement pour anonymiser des données
    (pour éviter la suppression de données dans des tables avec des
    contraintes de clés étrangères)

-   **my_table_csv_0.sql :** traitement pour l'exportation csv des
    données.

On peut ajouter systématiquement un fichier 404.sql dans chaque dossier.
Cela est assez utile pendant le développement où l'on peut faire des
erreurs sur les chemins.

Certains dossiers de COOP contiennent beaucoup de fichiers. Cela résulte
d'un choix d'appliquer le principe d'une fonction/fonctionnalité par
fichier. On pourrait avoir une application plus compacte en regroupant
plusieurs fonctions dans un même fichier mais COOP est un exercice
d'apprentissage où la lisibilité a été préférée à la performance.

## 5.4. Contenu des fichiers

Les fichiers ont une structure type :

-   **un entête** avec un filtre sur le niveau de permission de
    l'utilisateur  (SELECT \'dynamic\' AS component,
    sqlpage.run_sql(\'a_shells/shell_5.sql\') AS properties;)

-   (en option) la déclaration de **quelques variables** (SET
    my_variable =\...)

-   **un chemin de navigation **: (select \'breadcrumb\' as component; )
    ou **un panneau de gestion (**select \'datagrid\' as component;) ou
    des boutons / alertes (select \'button' as component; ), (select
    \'alert' as component; ),

-   **le composant principal **: (select \'form' as component; ), :
    (select \'table' as component; ) : (select \'list' as component; )
    \...avec un lien vers le ou les fichiers de traitement
    (create_0.sql, delete_0.sql\...)

Les fichiers de traitement avec un suffixe ₀ ont une structure plus
simple :

-   pas d'entête

-   (en option) la déclaration de **quelques variables** (SET
    my_variable =...)

-   une **requête SQL **: INSERT, UPDATE, DELETE

-   un retour (select \'redirect\' AS component,)

Dans les fichiers de traitement, les listes des champs sont souvent
rédigées avec un champ/une ligne ; cela facilite la lecture et la
correction).

# 6. Structures des tables

## 6.1. Nommage des tables et des colonnes

Le parti a été pris de nommer les colonnes de manière la plus explicite
possible, avec un rappel du nom de la table dans le nom de la colonne.
Cela alourdit l'écriture des requêtes mais d'une part cela facilite la
lecture de celle-ci et d'autre part cela évite les ambiguïtés entre les
tables (exemple : user_first_name ne peut être confondu avec
member_first_name) ou des confusions entre le nom d'une colonne et des
termes réservés (exemple : user_role ne peut être confondu avec le terme
réservé rôle).

## 6.2. Structures des tables

Si l'objectif est de publier des données dans le cadre d'un site web, la
structure des tables doit être adaptée à cet objectif.

Les tables sont construites autour de 4 types de colonnes :

-   les colonnes des clés primaires et étrangères,

-   les colonnes des données,

-   les colonnes de gestion des données,

-   les colonnes des métadonnées.

**Les colonnes des clés primaires et étrangères **: elles permettent de
maintenir la cohérence de la base de données mais dans la gestion du
site web elles vont jouer un rôle important dans l'écriture de chemins
pour la navigation d'un écran à l'autre
(my_file.sql ?table2_id='\|\|\$table2_id)

**Les colonnes de gestion des données** ont un intérêt particulier dans
le cadre d'un site web qui va servir d'outil de gestion des données, par
exemple :

-   le champ « **my_table_status **» avec les valeurs possibles :
    *online, draft, archived* va permettre de gérer la publication d'une
    donnée.

-   Le champ « **my_table_selected **» avec les valeurs possibles :
    *yes, no* va permettre de faire des sélections sur un groupe de
    données en vue d'une modification par lots,

-   le champ « **my_table_public_private**» avec les valeurs possibles :
    *public, private* va permettre de gérer la publication d'une donnée
    soit sur le site public soit pour des utilisateurs connectés.

-   Le schamps « **my_table_category **» ou « **my_table_type **» vont
    permettre d'utiliser la même table pour 2 modules distincts ou
    mettre en place des filtres dans l'affichage des données.

**Les colonnes de métadonnées** sont des données qui décrivent les
données. On peut donc décrire qui a créé la donnée, quand elle a été
créée, à qui est destinée... Cela peut être utile dans certains
traitements :

-   Les champs «**created_at, modified_at** vont permettre , par
    exemple, de retirer de l'affichage des événements dont la date est
    dépassée,

-   les champs «** author_id** » et « **recipient_id** » vont être
    centraux dans le module « chat »

# 7. Volet « corporate » et « community »

Le site est conçu pour une gestion dynamique de tous les éléments. La
table info_sections permet d'alimenter les différentes rubriques : CGV,
CGU, mentions légales...

Les informations administratives, la composition de l'équipe... sont
liées à une organisation. Le seul réglage initial est de fixer
correctement l'identifiant de cette organisation. Par défaut, le réglage
est orga_id = 1 et orga_dept_id = 1.

La description des organisations étant à 2 niveaux (orga et orga_dept),
il serait possible, si nécessaire, de présenter plusieurs départements
d'une même entreprise (ou plusieurs équipes d'un club de sport, ou
plusieurs classes d'une école).

La gestion des membres de l'organisation permet une gestion élémentaire
des adhérents d'une association. De même le module event permet la
gestion élémentaire de manifestations, réunions...

1.  Le module « espaces de travail » associe plusieurs modules. Les
    chemins vers les fichiers doivent souvent prendre en compte 2
    paramètres (par ex : user_id et workspace_id) pour éviter des
    ruptures dans les logiques d'affichage et de navigation. Le module
    est une version élémentaire et sans prétention de modules qui sont
    proposés dans de grandes applications type office365 ou
    googleworkspace. Mais au fil des ans ces applications sont devenues
    de plus en plus riches en fonctionnalités et sont parfois
    surdimensionnées pour des petites communautés de travail.L'accent a
    été placé sur l'ergonomie : rejoindre ou quitter un groupe de
    travail se fait d'un clic (join_0.sql, quit_0.sql). Le créateur d'un
    groupe de travail en devient le coordinateur et il est le seul à
    pouvoir créer une réunion, mais il peut aussi désigner un autre ou
    plusieurs participants comme co-cordinateurs, ils pourront alors
    créer aussi des réunions. Le coordinateur peut décider de fermer le
    groupe de travail. Cela revient à passer son statut à « archived »
    mais cela ne le supprime pas. Seuls des superviseurs auront la
    possibilité de supprimer définitivement un espace de travail.

    L'introduction de modules « community » dans COOP participe au
    souhait d'avoir tous les outils sous la main dans le cadre de la
    gestion d'un projet. On constate souvent une dispersion du travail
    des équipes entre une application de gestion de projet, une
    application de messagerie, une application de gestion de groupe...
    Mais il est difficile de rivaliser avec des applications dédiées et
    donc les modules de COOP restent très simples voir simplistes.

# 8. PRM : Project Relationship Management

L'acronyme CRM : Customer Relationship Management est bien connu.
L'approche CRM s'appuie le plus souvent sur une relation binaire :
vendeur_acheteur. Un projet est souvent un travail d'équipe et les
outils basés sur une relation binaire ne suffisent pas.

Dans l'approche PRM on trouve les classiques tables / carnets d'adresses
pour les personnes physiques (PRM1) et les personnes morales (PRM2).
Dans COOP on détaille les employées qui sont les personnes physiques
liées à une personne morale, comme dans les bases HRM (human resources
management). Cela permet d'utiliser COOP par exemple pour constituer des
équipes de joueurs ou gérer la répartition des élèves dans les classes
constituant une école.

COOP introduit une autre table, celle des groupes (PRM3) qui permet
toutes sortes de combinaisons : entre personnes physiques (un couple,
une famille, un groupe de bénévoles), entre des entreprises
(consortium...), entre des entreprises et des personnes physiques. Cette
table permet de résoudre ensuite des problèmes sur le volet intervention
sur des constructions. En effet, une maison est souvent la propriété non
d'une personne mais d'un couple. On peut aussi avoir à faire des travaux
dans un logement partagé par des colocataires. Durant les travaux, il
est courant que des entreprises s'associent temporairement pour répondre
à un appel d'offres. Dans le cas spécifique de COOP, on analyse le suivi
de chantiers réalisés par une famille et des artisans. La table PRM3
permet de gérer des situations comme la comme la constitution d'une
équipe sportive incluant selon le cas seulement les joueurs amateurs ou
les joueurs et les salariés du club sportifs.

# 9. Module Projet

## 9.1. Module Projet : orientation générale

Le module projet entre dans la catégorie PSM : Project Management
System. Il existe de nombreuses applications de gestion de projets.
Elles se distinguent entre elles par les finalités recherchées et le
contexte métier dans lesquelles elles sont déployées.

CO-OP vise surtout le pilotage et l'analyse de chantiers de rénovation
de bâtiment avec des équipes mixtes de professionnels et non
professionnels (démarche ARA : auto réhabilitation accompagnée). CO-OP
permet aussi de suivre l'ensemble des volets d'un projet : flux des
matériaux et services, temps de travail, bilan carbone, flux des
déchets\...

*CO-OP peut toutefois être transposé à d'autres types de projet
structurés autour de la notion de lots de travaux/tâches et de
séquences/tâches.*

Un autre aspect de CO-OP est de proposer un espace virtuel de travail,
un « hub » autour du projet avec des modules de planification des
réunions, de gestion de la documentation, un forum. Cela évite la
dispersion souvent constatée entre un outil de gestion de projet, des
documents dispersés ici et là, un outil de messagerie séparé...

CO-OP ne vise pas les projets complexes. Il privilégie une interface
sobre et ergonomique pour une possible alternative à la gestion de
projets avec des feuilles de calcul sous excel® ou calc® . Ces outils
sont très simples d'emploi mais marquent des limites. SQLPAge qui permet
d'exploiter une vraie base de données, permet de dépasser ces limites.
Il vise donc un public de particuliers conduisant un projet
d'auto-rénovation ou d'auto-construction, ou une association
accompagnant des particuliers dans ce type de démarche.

## 9.2. Module Projet : fonctionnalités

### 9.2.1. Pilotage du projet

Il est possible de suivre les données d'un projet au niveau de
l'ensemble du projet ou au niveau de chaque lot de travaux
(workpackage). Les utilisateurs connectés avec des droits de
superviseurs peuvent visualiser :

-   le planning sous forme de timeline (planification et le réel)

-   les dépenses engagées avec détail par type de dépenses et calendrier

-   l'empreinte carbone globale des matériaux mis en œuvre ([sur la base
    des données du catalogue
    ienes](https://base-inies.fr/consultation/recherche-fdes))

-   les temps de travail totaux, par séquence, par participant

-   les déchets par tranche de travaux par type et destination

-   la localisation des bâtiments

-   les photos liées aux bâtiments et leurs pièces.

### 9.2.2. Gestion du projet

Pour tous les utilisateurs connectés avec des droits de superviseurs ou
d'éditeurs, il est possible de :

-   créer, modifier les données concernant les projets, les lots de
    travaux, les séquences,

-   créer, participer à des réunions et à des forums de discussion,

-   partager des documents,

-   décrire les bâtiments où auront lieu les travaux,

-   gérer les photos et plans liés aux bâtiments.

## 9.3. Module Projet : structure

Dans CO-OP, les projets sont composés de lots de travaux
(wokpackages)qui regroupent des séquences (worksequences). Les
workpackages sont des lots de travaux cohérents : le génie civil, le
gros œuvre, la menuiserie, la plomberie... Les séquences de travail sont
les séquences de chantier proprement dites.

La gestion du projet s'appuie sur :

-   **la liste de projets** (project_main_display) avec la liste des
    projets + les éléments communs à tous les projets : base de
    matériaux qui sera nécessaire pour le calcul des bilans carbone, les
    lieux de réunions,

-   **le « hub » de chaque projet** (project_hub_display) en trois
    sections :

    -   un tableau de bord (accessible seulement aux superviseurs) avec
        des données de synthèse sur le planning, les dépenses, le bilan
        carbone, les temps de travail...

    -   un espace de gestion pour la gestion des lots de travaux, des
        bâtiments, des réunions, des documents

    -   la liste des lots de travaux

-   **le « hub » de chaque lot de travaux** (workpackage_hub_display) en
    trois sections :

    -   un tableau de bord (accessible seulement aux superviseurs) avec
        des données de synthèse sur le planning, les dépenses, le bilan
        carbone, les temps de travail...

    -   un espace de gestion pour la gestion des lots des séquences, des
        dépenses, des participants, des déchets et les matériaux

    -   la liste des séquences

## 9.4. Module Projet : gestion des droits

La gestion des projets est assurée par les superviseurs et les éditeurs.

Les superviseurs / gestionnaires de projet ont tous les droits
(création, édition, suppression) sur les projets et les éléments d'un
projet. Ils ont une section « tableau de bord » dans le hub d'un projet.
Ils ont accès au téléchargement des temps de travail par séquence ou par
participant.

Les éditeurs / chargés de projet ne peuvent pas créer de projet ni de
sprint, mais ils peuvent créer tous les éléments d'un projet :
workpackage, worksequence, bâtiment, réunion, document.

Il serait possible de configurer rapidement CO-OP pour mettre des
filtres d'accès suivant le type de projet. On pourrait ainsi répartir
les projets entre les chargés de projet en fonction de la nature du
projet ou de leur localisation géographique. Pour cela, il suffirait
d'ajouter une colonne G dans la table projet, un champ de saisie G lors
de la création d'un projet puis ajouter une condition G sur l'affichage
des projets. On réglera alors les droits des éditeurs en G1, G2, G3...
Ils ne pourront alors ne travailler que sur les projets correspondants à
leur groupe.

## 9.5. Module Projet : trucs et astuces

**Workpackage -- main :** la création d'un nouveau projet entraîne
automatiquement la création d'un lot de travaux de rang « main ».
Celui-ci sert de cadre général à l'analyse du déroulement du projet. On
lui donnera la durée totale du projet. Les participants de ce lot seront
le ou les maîtres d'ouvrage, maître d'œuvre, les bureaux d'étude... On
pourra enregistrer les dépenses générales et les dépenses fixes : frais
de permis de construire, frais d'étude... Une fois ce premier lot
renseigné, on peut créer les vrais lots de travaux.

**Workpackage -- planning :** La mécanique de ce module est basée sur la
date de départ (planifiée ou réelle) et la durée (planifiée ou réelle)
d'un lot de travaux. La date de fin (planifiée ou réelle) est calculée
directement à partir de ces deux données. Un lot de travaux peut être
indépendant ou relié à un lot de travaux parent. Dans ce cas, la date de
début planifiée est automatiquement renseignée à partir de la date de
fin planifiée du lot de travaux parent.

En cas de modification de la date de lancement planifiée ou de la durée
d'un lot de travaux qui est parent d'un ou plusieurs autres sprints, les
dates de lancement planifiées seront recalculées via une CTE récursive.

On visualise le calendrier des lots de travaux via le composant
« chart » sous forme d'un diagramme de GANTT simple.

Si l'on souhaite marquer des jalons dans la progression du projet, on
peut créer des lots de travaux d'une journée qui permettront de
visualiser ces jalons dans le calendrier. On peut alors passer au module
« réunion » pour fixer la date de la réunion de revue de chantier
correspondante.

**Documents** : on distingue les documents locaux, stockés sur le
serveur et les documents en ligne stockés sur un serveur distant. Cela
permet à une équipe projet de travailler collaborativement sur un
document type google doc®, office365® ou framapad®.

**Réunions** : l'inscription et la désinscription est très simple pour
les utilisateurs connectés ; il est possible d'inscrire des personnes
extérieures à partir des carnets d'adresse PRM1 ou PRM2. L'expérience
nous apprend que les réunions des équipes projet changent souvent de
date, d'heure, de lieu ou de contenu. Il a donc été prévu un système
d'alerte avec une notification par icône sur la liste des réunions.
CO-OP n'inclut pas un système d'envoi d'invitation par mail. Il serait
toutefois possible d'implanter cette fonctionnalité (voir contribution
<https://github.com/sqlpage/SQLPage/discussions/842> basée sur
l'utilisation de la fonction sqlpage.fetch_with_meta).

**Réunions (coordinateur) **: Quand un éditeur crée une réunion, il en
devient coordinateur et il peut l'éditer pour modification.

**Bâtiments** : la création d'un bâtiment entraîne automatiquement la
création d'une pièce du même nom qui aura le rang « main ». On ne
travaille ensuite qu'au niveau des pièces. La pièce « main » désigne le
bâtiment dans son ensemble.

**Localisation des bâtiments** : en cliquant sur le bâtiment, on peut
visualiser la description complète de celui-ci.

**Description géométrique/géographique des bâtiments **: CO-OP ne permet
pas d'intégrer les bâtiments dans un système d'information géographique
(GIS). Toutefois, il est possible d'ajouter la clause
\"sqlite_extensions\": \[\"mod_spatialite\"\] dans
/var/www/sqlpage/sqlpage/sqlpage.json pour assurer cette intégration. Il
faudrait bien sûr revoir la structure des tables « buildings » et
« building_rooms » pour finaliser cette intégration.

**Worksequence (durée)** : par défaut, CO-OP établit la durée d'une
séquence de travail par différence entre l'heure de fin et l'heure de
début. Toutefois, il serait possible de mettre en place un calcul à
partir de la durée déclarée pour chaque séquence. Une séquence de
chantier est de maximum 24 heures. La date de début de la séquence fait
aussi office de date de fin de la séquence.

Pour une analyse fine, il est préférable de séquencer les temps de
travail au plus près du réel. Par exemple une séquence le matin de 7:30
à 12:00 et une séquence dans l'après-midi de 13:30 à 17:00, plutôt
qu'une seule séquence 7;30 -- 17:00. Le grain de temps est de 15 mn, ce
qui est déjà très fin sur des chantiers où le calcul se fait plus
généralement à l'heure, la demie-journée ou la journée.

**CSV** : CO-OP permet d'exporter grâce au composant CSV le détail des
temps de chantier (worksequence) par lot de travaux, par séquence ou
pour un participant spécifique. Cela est possible par un jeu de liaisons
entre 6 tables, ce qu'il aurait été très difficile de réaliser dans un
simple tableur.

**Participants :** Les workpackages et woksequences sont tous liés à des
participants. Ceux-ci sont choisis dans les tables PRM1, PRM2 et PRM3.
Le type de participation dépend du niveau dans le projet :

-   participants → workpackage « main »: maître d'ouvrage, assistant
    maître d'ouvrage, architecte, maître d'œuvre, banque...

-   participants → workpackage : entreprises, consortium d'entreprises

-   participants → worksequence : entreprise, employé d'entreprise,
    intervenants non professionnel : maître d'ouvrage, membre de la
    famille, groupe d'entraide, bénévole.

Dans CO-OP, il y a 2 tables participant distinctes
(workpackage_participants et worksequences_participants). On aurait pu
imaginer une table unique avec un filtre suivant le type de
participation mais cela complique la structuration des formulaires de
saisie et les tables d'affichage sans apporter d'information
supplémentaire.

Pour renseigner les participants sur un projet, il est donc nécessaire
de les avoir créés en amont dans les tables prm1, prm2 ou prm3 selon les
cas.

**Bilan carbone :** Le bilan carbone est maintenant exigé pour les
constructions neuves et c'est un indicateur qui sera de plus en plus
utilisé dans le futur. Le calcul du bilan carbone d'un projet de
construction suppose un lien entre les outils de conception (logiciel de
conception architectural avec création des quantitatifs par type de
matériaux), une base de données de référence sur l'empreinte carbone de
chaque matériau (en France**, [base
ienes](https://base-inies.fr/consultation/recherche-fdes)**) et un
logiciel de calcul pour établir le bilan final. Ce calcul suit des
règles strictes comme, entre autres, l'utilisation de logiciels agréés.
CO-OP est loin de répondre à ces exigences. Il ne peut fournir qu'une
évaluation approximative de l'empreinte carbone d'une opération. Le
volet bilan carbone de CO-OP a un objectif pédagogique sans prétention
réglementaire.

Pour établir le bilan d'une opération, il faut d'abord alimenter la base
de données locale sur l'empreinte carbone des matériaux utilisés. Pour
cela il faut lister les matériaux utilisés, consulter la base **ienes**
pour récupérer le lien vers la fiche, l'unité fonctionnelle utilisée, la
valeur de l'indicateur global de l'équivalent carbone pour une unité
fonctionnelle du matériau concerné. On peut alors créer une fiche dans
CO-OP. Ensuite quand on se trouve dans un lot de travaux, on va pouvoir
établir le quantitatif de matériaux consommés. Pour établir ce
quantitatif soit on l'établit, en planifié, à partir des plans soit on
l'établit, au réel, à partir des achats de matériaux. L'unité
fonctionnelle de la base **ienes** ne correspond pas toujours à la
réalité du projet (*par exemple, l'empreinte carbone d'un matériau est
estimé pour 1 m² sur 30cm d'épaisseur alors que la mise en œuvre a été
réalisé sur une épaisseur de 20cm*). La réglementation impose
d'appliquer dans ce cas la valeur supérieure (*dans l'exemple, faire le
calcul comme si le mur avait 30 cm d'épaisseur*). CO-OP ne visant pas le
respect de réglementation mais une estimation pédagogique, on applique
une règle de trois pour rapprocher le calcul de l'empreinte carbone au
plus près de la quantité de matière relle. Par ailleurs, par souci de
simplicité pédagogique, le calcul ne prend en compte que la valeur
globale de l'empreinte carbone des matériaux alors qu'il serait possible
de développer le calcul sur d'autres indicateurs présents dans les
fiches de la base **ienes.**

**Gestion des déchets de chantier :** la gestion des déchets de chantier
est maintenant devenue obligatoire. CO-OP inclut un module pour assurer
ce suivi. Le module combine une analyse de la destination des déchets
(réemploi, recyclage...), la valeur (produit ou dépense) et l'empreinte
carbone des déchets qui devra donc être éventuellement soustraite de
l'empreinte carbone globale de l'opération.

# 10. Trucs et astuces

COOP se base sur la version socle de SQLPage, sans script ni composant
maison ni fonction avancée. Il y a donc certaines situations qui
demandent de trouver des solutions de contournement. Celles-ci résident
essentiellement dans la structure des tables avec l'utilisation de
colonnes spécifiquement créées pour faciliter la gestion des données et
la construction des requêtes. Les trucs et astuces suivants ne sont pas
forcément tout à fait orthodoxes et relèvent parfois du « bricolage».

## 10.0. Install CO-OP

Une install d'une base vide de CO-OP est possible à partir du fichier
sql :

/var/www/sqlpage/a_install/install_create_table.sql

Pour la création du premier administrateur, il faut lancer le fichier :

var/www/sqlpage/a_install/install_first_admin.sql

Il sera alors possible d'entrer dans COOP avec le couple email/mot de
passe :

<admin1@coopcoop.net> / CoopCoop1

Une fois entré dans CO-OP, il faudra impérativement modifier le profil
(mot de passe\...) d'admin1 via le sous menu « mon profil » sous le menu
« connect ». et détruire le fichier install_first_admin.sql.

Une alternative est de créer un profil avec le sous menu « sign-up »
puis aller dans la base pour renseigner la colonne « user-role » avec la
valeur admin pour le profil qui a été créé.

## 10.1. orga/orga_dept, place/place_space, building/building_room

Le volet « corporate » de COOP (volet B) décrit la structure qui est à
l'initiative de la publication du site web. Dans COOP, il a été prévu
que cette structure puisse avoir des « départements ». Si l'on prend
l'exemple d'un club sportif, celui-ci pourra avoir une section foot et
une section rugby. Intuitivement on pourrait organiser la liaison entre
les tables orga et orga_dept :

-   le club  → orga_id=1

-   la section foot → orga_id=1, orga_dept=1

-   la section rugby → orga_id=1, orga_dept=2

En fait, cela pose quelques problèmes pour formuler en une seule requête
SQL plusieurs cas de figures comme, par exemple, prendre en compte des
clubs qui ne sont pas organisés avec des sections (les joueurs
doivent-ils être rattachés au club ou à la section ?...). Cela oblige à
des requêtes sur la table orga et sur la table orga_dept. Il y a
plusieurs moyens pour contourner le problème. Dans COOP, le principe
adopté est de créer systématiquement un département fictif, étiqueté
« main » :

-   le club  → orga_id=1, orga_name= « sporting club »

-   la section « main » → orga_id=1, orga_dept=1, dept_type= « main »,
    dept_name = « sporting club »

-   la section foot → orga_id=1, orga_dept=2, dept_type= « dept »,
    dept_name= « foot »

-   la section rugby → orga_id=1, orga_dept=3, dept_type= « dept»,
    dept_name= « rugby »

Toutes les requêtes vont donc cibler le niveau des départements. La
création d'un département « main » va faciliter et clarifier traitements
comme le rattachement des joueurs à leur section sportive et des
salariés de l'encadrement du club à la section « main » (cela évite
d'avoir à gérer le rattachement de certains salariés à la table orga et
les autres à la table orga_dept). Le principe s'adapte bien avec une
entreprise avec un siège social et des établissements ou une école avec
plusieurs classes.

Le même principe est appliqué pour la gestion des lieux. L'utilisation
d'une table place_spaces permet de gérer des situations où une
organisation dispose de plusieurs lieux ou plusieurs salles dans un même
bâtiment (cas d'une école), plusieurs terrains sur un même centre
sportif. La création d'un lieu dans la table places (place_id=1,
place_name= « my_place ») entraîne la création automatique d'un espace
dans la table spaces (space_id=1, place_id=1, space_type= « main » ,
space_name= « my_place »).

Le fonctionnement des forums est aussi basé sur l'étiquetage du premier
message comme « main » les autres messages pouvant être qualifiés de
«post ».

Le principe utilisé s'avère assez robuste, mais il a une dimension
contre-intuitive quand on utilise COOP pour une organisation qui n'a pas
de département ou un seul lieu. Le pied de page de la page d'accueil du
site COOP est basé sur une requête sur orga_id=1, orga_dept_id=1. Il en
va de même pour le contenu des rubriques du menu « about » qui se base
sur la table « info_sections ». Le principe permet d'envisager de
sophistiquer le menu « about » par exemple pour présenter le profil des
joueurs de chaque section ou des élèves de chaque classe.

## 10.2. Forum, debug, chat

Ces trois modules s'appuient sur les mêmes tables : forum_topics,
forum_messages. Le filtrage entre les forums se fait grâce à la colonne
« forum_type ».

Forum et Debug sont des modules quasi jumeaux. Ils se distinguent que
par leurs finalités : discussion générale dans un cas et remontée de bug
sans l'autre. Certaines colonnes (debug_target) ne seront pas utilisés
dans forum et les choix de catégorie seront différents.

Chat se distingue la l'utilisation de deux colonnes de métadonnées
author_id et recipient qui permettent de limiter les échanges sur le
forum à 2 personnes.

La table forum_topics inclut des colonnes workspace_id, forum_group qui
permettent de créer des forums aux participants d'un espace de travail
ou à un groupe d'utilisateurs (voir notion de groupe dans la section
droits et permissions).

## 10.3. Liste de choix. Pattern

Les listes de choix dans les menus déroulants sont pilotées à partir de
2 tables sous contrôle de l'administrateur. Cela permet de garantir une
constance dans les listes et la possibilité de faire évoluer ces listes
sans avoir à intervenir sur les fichiers.

De même les règles RegEX sont pilotées depuis une table sous contrôle de
l'administrateur. Cela permet de les faire évoluer si nécessaires.

## 10.4. RSS

Dans la version socle de SQLPAGE (sans scripts), il n'est pas possible
d'envoyer des notifications vers un admin ou un superviseur depuis
SQLPage à partir de la création d'un enregistrement. L'admin doit donc,
par exemple, consulter la liste des comptes en attente pour débloquer
les droits des nouveaux utilisateurs. Pour éviter qu'il ait à consulter
cette liste toutes les heures, il a été créé dans COOP des flux RSS
(dossier /a_RSS-feed). L'admin peut alors coller le lien dans son client
courrier type thunderbird et il sera informé au rythme qu'il aura fixé
(toutes les heures, un fois pas jour...) d'une nouvelle inscription sur
le site.

Les fichiers de configuration des flux RSS doivent être codés à la main,
mais COOP intègre un module RSS de description de ces flux, ce qui
permet de les afficher soit dans le menu « about » pour les flux grand
public soit dans les panneaux d'administration admin, supervisor,
editor.

## 10.5 Purge des fichiers documents et images

Dans COOP il est possible de rattacher des documents à une organisation,
un groupe de travail, un bâtiment... Par prudence, il a été mis un
limite de 5 Mo pour la taille des documents mais le cumul de tous les
documents peut à la longue charger inutilement le serveur.

Quand on supprime un enregistrement lié à un document, on supprime les
métadonnées de description du document mais pas le fichier proprement
dit. Sans script, il n'est pas possible de déclencher la suppression du
fichier en même temps que la suppression de l'enregistrement. Pour
contourner le problème il a été prévu une table « files_to_erase » qui
stocke les url des fichiers à supprimer. L'admin peut alors
périodiquement purger le serveur des fichiers inutiles. La procédure a
fait l'objet d'une description qui est basé sur le composant « step » de
SQLPage.
