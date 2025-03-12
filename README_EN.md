**Table des matières**

[0. For those who don\'t read the manuals
1](#for-those-who-dont-read-the-manuals)

[1. Preamble 2](#preamble)

[1.1 Background to COOP development 2](#background-to-coop-development)

[1.2 Possible uses for COOP 2](#possible-uses-for-coop)

[121. A curio 2](#a-curio)

[122. Sandbox 2](#sandbox)

[121.Base for a production version 3](#base-for-a-production-version)

[1.3.Miscellaneous problems and bugs
3](#miscellaneous-problems-and-bugs)

[1.3.1 Internationalization 3](#internationalization)

[1.3.2. Bugs 3](#bugs)

[2. COOP general structure 4](#coop-general-structure)

[3.COOP modular approach 4](#coop-modular-approach)

[3.1. General principle 4](#general-principle)

[3.2 Simple module 4](#simple-module)

[3.3 Complex module 5](#complex-module)

[3.4. Dependency between modules 5](#dependency-between-modules)

[3.5. Cloning modules 5](#cloning-modules)

[4. Rights Permissions User privileges
5](#rights-permissions-user-privileges)

[4.1. CRUD permissions 5](#crud-permissions)

[4.2. Level and Group permissions 6](#level-and-group-permissions)

[4.3 Module rights distribution principle
7](#module-rights-distribution-principle)

[5. Folders and files 7](#folders-and-files)

[5.1. Naming folders 7](#naming-folders)

[5.2. File naming 7](#file-naming)

[5.3 Folder contents 8](#folder-contents)

[5.4. File contents 8](#file-contents)

[6. Table structures 9](#table-structures)

[6.1. Naming tables and columns 9](#naming-tables-and-columns)

[6.2. Table structures 9](#table-structures-1)

[7. \"Corporate\" and \"Community\" section
9](#corporate-and-community-section)

[8. PRM: Project Relationship Management
10](#prm-project-relationship-management)

[9. Project module 10](#project-module)

[9.1. Project module: general orientation
10](#project-module-general-orientation)

[9.2 Project module: structure 11](#project-module-structure)

[9.3. Project module: rights management
11](#project-module-rights-management)

[9.4.Project module: tips and tricks
11](#project-module-tips-and-tricks)

[10. Tips and tricks 12](#tips-and-tricks)

[10.0 Installing CO-OP 13](#installing-co-op)

[10.1. orga/orga_dept, place/place_space, building/building_room
13](#orgaorga_dept-placeplace_space-buildingbuilding_room)

[10.2. Forum, debug, chat 14](#forum-debug-chat)

[10.3. Choice list. Pattern 14](#choice-list.-pattern)

[10.4. RSS 14](#rss)

[10.5 Purging document and image files
14](#purging-document-and-image-files)

# 0. For those who don\'t read the manuals

You can explore the COOP website directly, either as a simple visitor (not logged in), or by
successively using the various possible statuses: viewer, editor,
supervisor, admin.

Installing COOP is straightforward:

-   download the entire COOP folder from Github

-   paste this folder into /var/www

-   release write permissions on sub-folders with an "x\_" prefix (these
    are used to download documents or images)

-   in the terminal, go to the COOP folder: /var/www/coop

-   launch SQLPage: /var/www/SQLPage/SQLPage.bin

-   in your browser, go to: http://localhost:8080/

-   start the tour.

To change roles, simply use the following identifiers:

-   viewer1@coopcoop.net

-   editor1@coopcoop.net

-   supervisor1@coopcoop.net

-   admin1@coopcoop.net

with password: CoopCoop1

You can create new users, but you\'ll then need to switch to "admin"
mode to set the rights of new administrators.

In the admin panel, you\'ll find a "Help Dev" menu with COOP\'s on-board
documentation.

To complete the demo, in the admin, supervisor and editor panels,
you\'ll find links to RSS feeds (see the principle of these feeds in
Help-Dev).

# 1. Preamble

## 1.1 Background to COOP development

COOP is the result of a "no-pro" learning curve in sql via SQLPage (IT
development is not my profession and my IT culture is very limited). The
aim was to develop a complete, functional, dynamic website (all content
managed from tables). The purpose of the central database is to monitor
building rehabilitation projects as part of participative projects
involving professionals and private individuals. These projects are
monitored and coordinated by a network of independent associations. This
explains the name of the site and the section devoted to collaborative
work (see section C below).

COOP\'s code is very simple: use of SQLITE as the database management
engine, basic SQL queries (elementary queries: no use of triggers,
pragma\...), SQLPage base (no custom components, no scripts), very
academic query writing, very explicit file and folder names\...

There must be errors in the database schema and in the writing of
certain queries.

## 1.2 Possible uses for COOP

### 121. A curio

COOP offers a possible way of building a web site with SQLPage. Certain
aspects of COOP may provide a source of inspiration. This completes the
examples given in [the official SQLPage
documentation](https://sql-page.com/documentation.sql) website or in
tutorials such as [LearnSQLPage](http://learnsqlpage.com/).

### 122. Sandbox

COOP is the result of a learning curve; it can be used as a sandbox for
other "no-pro" wishing to familiarize themselves with the SQLPage
application, the SQL language and website design to host a specific
database.

The development of COOP has involved only free and open source software
(see the \'our sponsors\' menu on the site).

The main documentation sources used were :

-   [SQLPage documentation](https://sql-page.com/documentation.sql)

-   [SQLPage discussion
    forum](https://github.com/sqlpage/SQLPage/discussions)

-   various tutorial sites and forums focusing on SQLITE, SQL, CSS\...
    **(thanks to all contributors!**)

-   and for testing purposes, a free AI site. The use of AI is, in the
    short term, quite effective, for an isolated beginner, to correct
    the syntax of SQL queries; however, we must remain aware of the
    environmental cost of AI and its predatory dimension, as it feeds on
    the work of those who write tutorials or provide answers on forums.
    And, in terms of real efficiency, it is ultimately more effective to
    take a complete course on SQL or buy a reference book than to become
    dependent on an AI search engine. AI applied to computer code is
    like comparing frozen pizza to homemade pizza: it\'s quick, it looks
    good, but in the end it\'s more expensive and not necessarily
    better.

### 121.Base for a production version

**Warning***: COOP may be functional, but it would be unwise to use it
for a production version. You can use parts of it, for example,
component A (see COOP general structure) to put an in-house database
online. But before considering using COOP in whole or in part for a
production version, you should first have the code and schema reviewed
by a professional.*

Furthermore, for reasons of ease of use and learning, COOP was developed
using SQLITE. However, this type of database engine is not optimal for
simultaneous connections, which is COOP\'s specificity (see "community
tools" below). For a production version, we would need to migrate to
postgresql. But this migration is not trivial, as it would involve :

-   revising data formats (sqlite is rather simplistic in this respect,
    whereas postgresql is more sophisticated),

-   revising certain queries (json object\...), as sqlite and postgresql
    do not use the same syntax

-   review the permissions management system (see below: rights
    permissions privileges), which are managed at table level in
    postgresql.

Last but not least, you\'ll need to integrate a few scripts to perform
certain functions, for example, to ensure :

-   dual-level authentication

-   management of forgotten passwords,

-   sending e-mails and notifications,

-   print settings,

-   manage database maintenance tasks.

## 1.3.Miscellaneous problems and bugs {#miscellaneous-problems-and-bugs .unnumbered}

### 1.3.1 Internationalization

I\'m a French speaker and the content of labels, contents,
contents_md\... is in French. The basic version of SQLPage does not
include internationalization functionality (this can be done via
scripts). However, all recent web browsers include instant translation
functions, making it unnecessary to translate content upstream in the
site code. However, the choice lists are managed from 2 tables
(choice_categories, choice_items), which facilitates their eventual
adaptation.

On the other hand, we\'ve decided to name tables, folders and files in
"globish" (global english aka broken english!), which is the standard
for computer languages such as sql, html, css, SQLPage, etc. This means
that COOP can be used by non-French speakers.

### 1.3.2. Bugs

As far as possible, COOP has been debugged, but there may still be bugs
here and there. SQLPage includes a fairly efficient bug-checking engine
to help locate these. Occasionally, however, you may come across a blank
page. This is often due to ;

-   an incorrect path

-   the absence of a "myparemeter_id" argument in a path
    (myfile.sql?myparameter_id=\'\|\|\$myparameter)

-   a query in a column containing a NULL value.

# 2. COOP general structure

There are many commercial or open source, no-code applications available
to meet the most classic needs expected of a web site. But there are
cases where the database structure is too specific to use one of these
applications. The website must therefore be built around the database.
This is the purpose of SQLPage, a major advantage of which is that it is
a "simple code" application accessible to people whose core business is
not IT development, but who need to put a specific database online.

Putting a database online is not limited to putting the data itself
online. It also involves the development of other peripheral functions
expected of a web site:

-   "**admin**" function: website administration, user rights management
    and maintenance,

-   "**corporate**" function: presenting the structure that publishes
    the website: who we are, what we do, presenting our team\...

-   "**contact**" function: provide a contact and exchange interface for
    visitors: contact form, registration form, FAQ\...

-   "**interface**" function: to provide an interface for feeding and
    maintaining the database that justified the creation of the site,

-   **"community**" function: offering collaborative tools for editors
    who feed the database or produce content for the site.

COOP\'s structure is designed to meet all these functions. The folders
are logically organized, with functions identified by alphabetical
suffixes.

-   The first group covers non-specific functions

    -   **group A suffix /a\_**: site management admin modules:
        sessions, users, info, rss\...

    -   **group B suffix /b\_**: corporate and visitor contact modules

    -   **group C suffix /c\_**: community modules: forum, chat,
        wokspaces\...

-   and a second group of files specific to COOP whose theme is the
    management of supported housing rehabilitation projects (interface
    function):

    -   **group D suffix /d\_**: PRM (project relationship management)
        modules

    -   **group E suffix /e\_**: PMS (project management system) modules

-   Finally, documents, images, etc. are grouped in special folders:

    -   **group X suffix /x\_**: document storage modules.

In order to put a specific database online (groups D and E), it is
necessary to ensure the development of the other components and at least
the modules of group A.

# 3.COOP modular approach

## 3.1. General principle

A module is defined as all the elements required to create a particular
functionality. Each component A, B, C, D, E corresponds to a coherent
set of modules.

## 3.2 Simple module

A simple module consists of :

-   a table

-   a simple folder (see folder contents) containing files for creating,
    editing, publishing and deleting data,

-   a link in the menu bar

-   a link in the admin, supervisor or editor administration table, as
    appropriate

Example of a simple module: news (folder /b_news), which enables
articles to be published either on the public site or on the internal
site.

## 3.3 Complex module

A complex module is made up of :

-   several tables, sometimes linked by constraints (foreign keys)

-   several folders containing files for creating, editing, publishing
    and deleting data in each table,

-   a link in the menu bar

-   a link in the admin, supervisor or editor administration table, as
    appropriate

example of a complex module: workspaces (folder /c_wokspaces), which
combines tables for forum management, chat, document sharing and meeting
organization.

## 3.4. Dependency between modules

Even for simple modules, there are dependencies:

-   all modules depend on Group A modules: users, sessions, shells,
    panels, info

-   there are dependencies between certain modules within group B (e.g.:
    members, orga_dept, events, place, place_space tables depend on
    orga)

-   certain modules in group C are dependent on tables in group B
    (meetings and workmeetings are dependent on place_space, and
    therefore on orga and orga_dept)

-   group D modules depend only on group A base modules

-   group E modules depend on group D modules and group A base modules

Dependency links can be visualized by browsing through tables to
identify references to an external table, often (but not always) to a
foreign key.

The deletion of certain records in a table implies the deletion of
related records in other tables. In this case, COOP systematically
displays a warning message before deleting a parent record. A
"my_table_status" field has been introduced in most tables. This allows
a record to be archived rather than deleted. For tables of type users,
members, etc., data anonymization is provided, which can be used when a
person requests the deletion of their personal data from the database.

## 3.5. Cloning modules

If a certain consistency is maintained in the naming of tables, columns,
folders and files, it is possible to create a new module, by a
succession of copy/paste/rename operations based on the structure of a
reference module. This doesn\'t mean you don\'t have to do some coding
if you add or remove columns from certain tables, but it does save you a
lot of time on the overall coding of the module.

# 4. Rights Permissions User privileges

## 4.1. CRUD permissions

COOP distinguishes several roles for logged-in users:

-   **viewer**: this role gives access to read internal information
    (news, agenda, FAQ) and post in the forum

-   **editor:** this role enables users to read, create and edit content

-   **supervisor**: this role allows you to read, create, edit and
    delete content

-   **admin**: this role is mainly dedicated to site management and has
    control over users.

Users create their own accounts and passwords. By default, they have no
role. Their permission level will be decided by the admin. There is
therefore no circulation of passwords at any time, and they are not
stored in the database (only the hash_password).

The admin is informed of account creation requests via a dedicated RSS
feed (/a_rss_feed/rss_new_users_5.sql).

Access to sql files is filtered by a specific shell component:

-   /a_shells/shell_2.sql for viewers

-   /a_shells/shell_3.sql for editors

-   /a_shells/shell_4.sql for supervisors

-   /a_shells/shell_5.sql for admins

After verifying the user\'s role, each shell calls a shell_core
(/a_shells/shell_core.sql), which displays the user\'s permissions menu.

To make it easier to find your way around files according to permission
levels, we\'ve adopted the principle of using suffixes at the end of the
file name:

-   /news_private_display_3.sql: editor file for internal news list

-   /news_private_display_4.sql: supervisor file for listing internal
    news (same as above, but with an additional DELETE function).

-   Files with the suffix \_1₁ are files accessible to any logged-in
    user (e.g. /a_panels/panel_user_1.sql for user profile updates).

-   Files with the suffix \_0 are intermediate processing files (INSERT,
    UPDATE, DELETE) without a header.

-   Files without a suffix are files linked to site visitors who are not
    logged in (e.g. /var/www/SQLPage/b_about/orga_about.sql for the "Who
    are we?" menu).

## 4.2. Level and Group permissions

COOP includes the ability to manage 2 other types of permissions:

-   level (L): permission to access certain fields in a table, or a
    particular child table of a main table

-   group (G): permission to access all the fields in a table, but only
    part of the data.

To understand the possible usefulness of these two filters, let\'s
imagine a sports club with 2 sections: soccer and rugby:

-   members are assigned a CRUD "viewer" permission: they can consult
    internal news, post comments on the forum\... but have no access to
    player data

-   an "editor" CRUD permission is assigned to sports coaches, trainers
    and accountants

-   a CRUD "supervisor" permission is assigned to managers, the doctor
    and the financial director.

-   The player data table can be designed in 2 ways: either as a PLAYER
    table with fields: L1_player_sport_data, L2_player_medical_data,
    L3_player_financial_data or as a main PLAYER table (player_id,
    player_name) and 3 linked tables:L1_SPORT (player_id, sport_data),
    L2_MEDICAL (player_id, medical_data), L3_FINANCIAL (player_id,
    financial_data).

-   We then assign L1 permission to sports coaches, L2 to caretakers and
    L3 to accountants. This ensures that each manager only sees the data
    relevant to him or her (and avoids everyone having access to
    sensitive medical or financial data).

-   In addition, you can insert a "group" field in each table, with the
    value G1 for soccer and G2 for rugby. A G1 coach will only be able
    to consult and edit level 1 data (sports data) for soccer players.
    CREATE queries can also be set up, so that a record created by a G1
    coach will automatically take the value G1.

-   For managers, we can keep the L filter (medical data is only visible
    to a doctor), but give them access to all players, with data
    deletion rights.

The combination of the three types of permissions (CRUD, L, G) covers a
very wide range of situations.In a company, you can associate each
department with a group; in a school, you can create combinations
between classes and levels\...

## 4.3 Module rights distribution principle

Rights are distributed by section:

-   /a\_ modules: admin (5) general site administration, user
    management, debugging, \...

-   /b\_ : supervisor (4) general content, organization and member
    descriptions, event validation\...

-   /c\_ modules: all logged-in users (1) with ultimate moderation by
    the administrator (5)

-   /d\_ and /e\_ modules: editors (3) with supervisor moderation (4)

COOP does not value the L and G filters. This could have been possible
on the PRM and project modules to separate teams or assign certain teams
to certain jobs, or distribute teams according to building location.

# 5. Folders and files

## 5.1. Naming folders

Folders group together the files of a given module or sub-module (see
modular approach).

File naming is based on :

-   a suffix to identify the user\'s profile without having to open the
    file (see CRUD permissions)

-   a reminder of the table name

## 5.2. File naming

File naming is based on :

-   a term that intuitively evokes the table associated with the module,

-   a term that evokes the module component: main, archive, doc\....,

-   a term that evokes the sql query or SQLPage component,

-   a prefix that refers to the section to which the file belongs (see
    COOP general structure).

Example:

-   **my_table_main_display_4.sql** → the file can only be opened by a
    user with supervisor rights, it concerns the "my_table"
    table/module, "main" means that we\'re on the module\'s central
    processing and display that the query is either a table or list
    component,

-   **my_table_archive_display_4.sql** → the file can only be opened by
    a user with administrator rights, it concerns the "my_table"
    table/module, "archive" means we\'re on columns where the value of
    "may_table_status"="archived" and display that the query is either a
    component

-   **my_table_main_create_0.sql** → the file is a processing file,
    without a header, with a CREATE request. it concerns the "my_table"
    table/module.

This leads to rather cumbersome file path names, but makes for intuitive
reading (no need to open the file to find out its contents and role) and
avoids possible confusion between modules that are almost twins (e.g.
forum and debug modules). This is particularly useful when designing a
website, especially if this is done in collaborative mode.

Consistent file naming facilitates module cloning. Simply perform a
series of copy/paste/rename operations to create a new module from a
reference module.

## 5.3 Folder contents

The folder contains a series of files that can be referred to as the
heart of the module, and which are identified by the term "main". For
example :

-   **my_table_main_display_4.sql**: the list or table used to display
    table data (the 4 indicates that this file can only be opened by a
    supervisor with DELETE permission).

-   **my_table_main_display_3.sql**: the list or table used to display
    table data (the 4 indicates that this file can only be opened by an
    editor with read, create and modify permissions)

-   **my_table_main_form_3.sql**: the form used to create data

-   **my_table_main_edit_3.sq**l: the form used to update data

-   **my_table_main_form_4.sql**: the form used to create data (the
    supervisor may have access to certain additional fields compared to
    the editor. For example, the supervisor controls the
    "my_table_status" field, which authorizes a record to be put online
    or archived).

-   **my_table_main_edit_4.sql**: the form used to update data

-   **my_table_main_create_0.sql**: data insertion processing in the
    database

-   **my_table_main_update_0.sql**: data insertion processing in the
    database

-   **my_table_main_delete_0.sql:** processing used to delete data from
    the database

Around the \"main\" heart of the folder, depending on the complexity of
the module, we create with the same logic the files linked to the
secondary functions:

-   **my_table_doc_display_4.sql**: if the main function of the module
    is the description of a company, the \"doc\" files concern the
    processing of documents associated with each company We can also
    have files for specific functionalities:

-   **my_table_archive_display_4.sql:** visualization of archived data

-   **my_table_anonym_0.sql**: processing to anonymize data (to avoid
    deleting data in tables with foreign key constraints)

-   **my_table_csv_0.sql**: processing for csv export of data. We can
    systematically add a 404.sql file in each folder. This is quite
    useful during development where we can make mistakes on the paths.
    Some COOP folders contain a lot of files. This results from a choice
    to apply the principle of one function/functionality per file. A
    more compact application could be achieved by grouping several
    functions in a single file, but COOP is a learning exercise where
    readability was preferred to performance.

## 5.4. File contents 

1.  The files have a typical structure:

-   a header with a filter on the user permission level (SELECT
    \'dynamic\' AS component, sqlpage.run_sql(\'a_shells/shell_5.sql\')
    AS properties;)

-   (optional) the declaration of some variables (SET my_variable =\...)

-   a navigation path: (select \'breadcrumb\' as component; ) or a
    management panel (select \'datagrid\' as component;) or
    buttons/alerts (select \'button' as component; ), (select \'alert'
    as component; ),

-   the main component: (select \'form' as component; ), : (select
    \'table' as component; ) : (select \'list' as component; ) \...with
    a link to the processing file(s) (create_0.sql, delete_0.sql\...)

1.  Processing files with a suffix ₀ have a simpler structure:

-   no header

-   (optional) the declaration of some variables (SET my_variable =...)

-   a SQL query: INSERT, UPDATE, DELETE

-   a return (select \'redirect\' AS component,) In processing files,
    field lists are often written with one field/one line; this makes
    reading and correction easier).

# 6. Table structures

## 6.1. Naming tables and columns

The decision was made to name the columns as explicitly as possible,
with a reminder of the table name in the column name. This makes writing
queries more cumbersome, but on the one hand it makes them easier to
read and on the other hand it avoids ambiguities between tables
(example: user_first_name cannot be confused with member_first_name) or
confusion between the name of a column and reserved terms (example:
user_role cannot be confused with the reserved term role).

## 6.2. Table structures

If the objective is to publish data as part of a website, the structure
of the tables must be adapted to this objective. The tables are built
around 4 types of columns:

-   primary and foreign key columns,

-   data columns,

-   data management columns,

-   metadata columns.

**Primary and foreign key columns**: they help maintain the consistency
of the database but in the management of the website they will play an
important role in writing paths for navigation from one screen to
another (my_file.sql?table2_id='\|\|\$table2_id)

**Data management columns** are of particular interest in the context of
a website that will serve as a data management tool, for example:

-   the "my_table_status" field with the possible values: online, draft,
    archived will allow you to manage the publication of data.

-   the "my_table_selected" field with the possible values: yes, no will
    allow you to make selections on a group of data for batch
    modification,

-   the "my_table_public_private" field with the possible values:
    public, private will allow you to manage the publication of data
    either on the public site or for connected users.

-   The \"my_table_category\" or \"my_table_type\" fields will allow you
    to use the same table for 2 separate modules or set up filters in
    the data display.

**Metadata columns** are data that describe the data. We can therefore
describe who created the data, when it was created, who it is intended
for, etc. This can be useful in certain treatments:

-   The \"created_at, modified_at\" fields will allow, for example, to
    remove events whose date has passed from the display,

-   the \"author_id\" and \"recipient_id\" fields will be central in the
    \"chat\" module

# 7. \"Corporate\" and \"Community\" section

The site is designed for dynamic management of all elements.

The info_sections table is used to populate the various sections: T&Cs,
T&Cs, legal notices Administrative information, team composition, etc.
are linked to an organization. The only initial setting is to correctly
set the identifier of this organization. By default, the setting is
orga_id = 1 and orga_dept_id = 1. Since the description of organizations
is at 2 levels (orga and orga_dept), it would be possible, if necessary,
to present several departments of the same company (or several teams of
a sports club, or several classes of a school).

The management of the members of the organization allows basic
management of the members of an association. Similarly, the event module
allows basic management of events, meetings, etc.

The \"workspaces\" module combines several modules. File paths often
need to take into account 2 parameters (e.g.: user_id and workspace_id)
to avoid breaks in display and navigation logic. The module is a basic
and unpretentious version of modules that are offered in large
applications such as office365 or googleworkspace. But over the years
these applications have become increasingly rich in features and are
sometimes oversized for small work communities.

The emphasis has been placed on ergonomics: joining or leaving a
workgroup is done with one click (join_0.sql, quit_0.sql). The creator
of a workgroup becomes its coordinator and is the only one who can
create a meeting, but he can also designate another or several
participants as co-coordinators, they will then also be able to create
meetings. The coordinator can decide to close the workgroup. This is
equivalent to changing its status to \"archived\" but this does not
delete it. Only supervisors will be able to permanently delete a
workspace.

The introduction of \"community\" modules in COOP contributes to the
desire to have all the tools at hand as part of project management. We
often see a dispersion of team work between a project management
application, a messaging application, a group management application,
etc. But it is difficult to compete with dedicated applications and
therefore COOP modules remain very simple or even simplistic.

# 8. PRM: Project Relationship Management

The acronym CRM: Customer Relationship Management is well known. The CRM
approach is most often based on a binary relationship: seller_buyer. A
project is often a team effort and tools based on a binary relationship
are not enough.

In the PRM approach we find the classic tables / address books for
individuals (PRM1) and legal entities (PRM2). In COOP we detail the
employees who are the individuals linked to a legal entity, as in the
HRM (human resources management) databases. This allows COOP to be used,
for example, to form teams of players or manage the distribution of
students in the classes making up a school. COOP introduces another
table, that of groups (PRM3) which allows all sorts of combinations:
between individuals (a couple, a family, a group of volunteers), between
companies (consortium, etc.), between companies and individuals. This
table then allows you to solve problems on the construction intervention
side. Indeed, a house is often owned not by one person but by a couple.
You may also have to do work in a home shared by roommates. During the
work, it is common for companies to temporarily join forces to respond
to a call for tenders. In the specific case of COOP, we analyze the
monitoring of construction sites carried out by a family and craftsmen.
The PRM3 table allows you to manage situations such as the constitution
of a sports team including, depending on the case, only amateur players
or players and employees of the sports club.

# 9. Project module

## 9.1. Project module: general orientation

The project module falls into the PSM category: Project Management
System. There are many different project management applications. They
can be distinguished from one another by their intended purpose and the
business context in which they are deployed.

CO-OP main aim is to analyze the actions of players at every level of
the project. CO-OP was designed for the specific context of building
renovation projects involving mixed teams of professionals and
non-professionals (ARA: auto réhabilitation accompagnée). It would be
possible to enrich CO-OP with tables on materials and services in order
to provide a more complete analysis, including detailed costs.

CO-OP can, however, be transposed to other types of project structured
around the notion of work packages/tasks and sequences/tasks.

Another aspect of CO-OP is that it offers a virtual workspace, a "hub"
around the project, with modules for scheduling meetings, managing
documentation and a forum. This avoids the dispersion often seen between
a project management tool, documents scattered here and there, a
separate messaging tool...

CO-OP is not designed for complex projects. It favors a sober, ergonomic
interface as a possible alternative to project management with excel® or
calc® spreadsheets. These tools are very easy to use, but have their
limitations. SQLPAge, which allows you to use a real database, overcomes
these limitations.

## 9.2 Project module: structure

In CO-OP, projects are made up of wokpackages, which group together
worksequences. Workpackages are coherent work packages: civil
engineering, structural work, carpentry, plumbing, etc. Worksequences
are the actual site sequences.

Since COOP\'s purpose is to create or renovate buildings, each project
is associated with one or more locations. Each location can be broken
down into rooms. In this way, work sequences can be linked to a specific
room (e.g. a kitchen electrical installation project). Images can be
associated with each room.

Finally, SQLPage\'s chart component enables you to view results in
graphical form (e.g. cost statistics) or publish results on the public
site (project menu).

## 9.3. Project module: rights management

Projects are managed by supervisors and editors.

Supervisors have full rights (create, edit, delete) over projects and
project elements. They have a "dashboard" section in the project hub.
They can download working times by sequence or by participant.

Editors cannot create projects, but they can create all the elements of
a project: workpackage, worksequence, building, meeting, document.

It would be possible to quickly configure CO-OP to set access filters
according to project type. In this way, projects could be distributed
among editors according to the nature of the project or their
geographical location. To do this, simply add a G column in the project
table, a G input field when creating a project and then add a G
condition to the project display. We would then set editors\' rights to
G1, G2, G3\... They would then only be able to work on projects
corresponding to their group.

## 9.4.Project module: tips and tricks

**Sprint:**  Each project is also associated with phases (sprints). It would be logical to link sprints and workpackages, as is done in major projects. In COOP, we have chosen not to link sprints and workpackages, to avoid excessive rigidity. The sprint module is mainly used to visualize the major phases of a project, and to link them to documents such as work schedules...

The mechanics of this module are based on the start date (planned or actual) and duration (planned or actual) of a sprint. The end date (planned or actual) is calculated directly from these two data. A sprint can be independent or linked to a parent sprint. In this case, the planned start date is automatically calculated from the planned end date of the parent sprint.

If the planned start date or duration of a sprint that is the parent of one or more other sprints is modified, the planned start dates will be recalculated via a recursive CTE. 
The sprint schedule is visualized via the “chart” component in the form of a GANTT graph. 

If you wish to mark milestones in the progress of the project, you can create one-day sprints, which will enable you to visualize these milestones in the calendar. You can then move on to the “meeting” module to set the date for the corresponding site review meeting.

**Documents:** a distinction is made between local documents, stored on
the server, and online documents, stored on a remote server. This
enables a project team to work collaboratively on a document such as
google doc®, office365® or framapad®.

**Meetings:** registration and deregistration is very simple for
logged-in users; it is possible to register external persons from the
PRM1 or PRM2 address books.But without additional scripting, it is not
possible to manage the sending of invitations or
notifications.Experience has taught us that project team meetings often
change date, time, place or content. We have therefore included an alert
system with a notification icon on the meeting list.

**Meetings (coordinator)**:When an editor creates a meeting, he becomes
its coordinator and can edit it for modification.

**Buildings:** when a building is created, a room of the same name is
automatically created, with the rank of "main".From then on, we only
work at part level.The "main" part refers to the building as a whole.

**Building location:** click on the building to view its full
description.

**Geometric/geopgraphic description of buildings:**CO-OP does not allow
buildings to be integrated into a geographic information system (GIS).
However, it is possible to add the "sqlite_extensions" clause:
\["mod_spatialite"\] in /var/www/sqlpage/sqlpage/sqlpage.json to ensure
this integration.Of course, the structure of the "buildings" and
"building_rooms" tables would have to be revised to finalize this
integration.

**Worksequence (duration):** by default, CO-OP establishes the duration
of a work sequence by the difference between the end time and the start
time.However, it would be possible to set up a calculation based on the
duration declared for each sequence. A worksite sequence is a maximum of
24 hours.The sequence start date also acts as the sequence end date.

For a detailed analysis, it is preferable to sequence working times as
close as possible to the actual time. For example, a morning sequence
from 7:30 to 12:00 and an afternoon sequence from 13:30 to 17:00, rather
than a single sequence from 7:30 to 17:00. The time grain is 15 minutes,
which is already very fine on construction sites where calculations are
usually made by the hour, half-day or day.

**CSV:** CO-OP\'s CSV component enables you to export worksequence
details by work package, by sequence or for a specific participant.This
is made possible by a set of links between 6 tables, which would have
been very difficult to achieve in a simple spreadsheet.

**Participants :** Projects, workpackages and woksequences are all
linked to participants. These are selected from the PRM1, PRM2 and PRM3
tables.The type of participation depends on the project level:

-   participants → project: owner, assistant owner, architect, prime
    contractor, bank\...

-   participants → workpackage: companies, consortium of companies

-   participants → worksequence: entrprise, company employee,
    non-professional stakeholders: project owner, family member,
    self-help group, volunteer.

In CO-OP, there are 3 distinct participant tables. We could have
imagined a single table with a filter according to the type of
participation, but this would complicate the structuring of input forms
and display tables without providing any additional information.

# 10. Tips and tricks

COOP is based on the basic version of SQLPage, without scripts,
home-made components or advanced functions. There are therefore certain
situations that require finding workarounds. These mainly reside in the
structure of the tables with the use of columns specifically created to
facilitate data management and query construction. The following tips
and tricks are not necessarily completely orthodox and sometimes involve
\"tinkering\".

## 10.0 Installing CO-OP

You can install an empty CO-OP database from the sql file :

/var/www/sqlpage/a_install/install_create_table.sql

To create the first administrator, run the :

var/www/sqlpage/a_install/install_first_admin.sql

It will then be possible to log into COOP with the email/password pair:

admin1@coopcoop.net / CoopCoop1

Once you\'ve entered CO-OP, you\'ll need to modify the profile
(password, etc.) of admin1 via the "my profile" sub-menu under the
"connect" menu, and delete the install_first_admin.sql file.

Alternatively, you can create a profile using the "sign-up" sub-menu,
then go into the database and fill in the "user-role" column with the
value admin for the profile you\'ve created.

## 10.1. orga/orga_dept, place/place_space, building/building_room

The \"corporate\" section of COOP (section B) describes the structure
that is responsible for publishing the website. In COOP, it has been
planned that this structure can have \"departments\". If we take the
example of a sports club, it could have a football section and a rugby
section. Intuitively we could organize the link between the orga and
orga_dept tables:

-   the club → orga_id=1

-   the football section → orga_id=1, orga_dept=1

-   the rugby section → orga_id=1, orga_dept=2

In fact, this poses some problems to formulate in a single SQL query
several cases such as, for example, taking into account clubs that are
not organized with sections (should the players be attached to the club
or to the section?\...). This requires queries on the orga table and on
the orga_dept table. There are several ways to get around the problem.
In COOP, the principle adopted is to systematically create a fictitious
department, labeled \"main\":

-   the club → orga_id=1, orga_name= \"sporting club\"

-   the \"main\" section → orga_id=1, orga_dept=1, dept_type= \"main\",
    dept_name = \"sporting club\"

-   the football section → orga_id=1, orga_dept=2, dept_type= \"dept\",
    dept_name= \"foot\"

-   the rugby section → orga_id=1, orga_dept=3, dept_type= \"dept\",
    dept_name= \"rugby\"

All queries will therefore target the department level. The creation of
a \"main\" department will facilitate and clarify processes such as the
attachment of players to their sports section and club management
employees to the \"main\" section (this avoids having to manage the
attachment of certain employees to the orga table and others to the
orga_dept table). The principle adapts well to a company with a head
office and establishments or a school with several classes.

The same principle is applied for managing places. Using a place_spaces
table allows you to manage situations where an organization has several
places or several rooms in the same building (case of a school), several
fields on the same sports center. Creating a place in the places table
(place_id=1, place_name= "my_place") automatically creates a space in
the spaces table (space_id=1, place_id=1, space_type= "main",
space_name= "my_place"). The functioning of forums is also based on
labeling the first message as "main" the other messages can be qualified
as "post". The principle used turns out to be quite robust, but it has a
counter-intuitive dimension when using COOP for an organization that
does not have a department or a single place. The footer of the COOP
website home page is based on a query on orga_id=1, orga_dept_id=1. The
same goes for the content of the sections of the \"about\" menu which is
based on the \"info_sections\" table. The principle allows us to
consider making the \"about\" menu more sophisticated, for example, to
present the profile of the players in each section or the students in
each class.

## 10.2. Forum, debug, chat

These three modules are based on the same tables: forum_topics,
forum_messages. Filtering between forums is done using the
\"forum_type\" column. Forum and Debug are almost twin modules. They are
distinguished only by their purposes: general discussion in one case and
bug reporting in the other. Some columns (debug_target) will not be used
in forum and the category choices will be different. Chat is
distinguished by the use of two metadata columns author_id and recipient
which allow to limit exchanges on the forum to 2 people. The
forum_topics table includes columns workspace_id, forum_group which
allow to create forums for participants of a workspace or a group of
users (see notion of group in the rights and permissions section).

## 10.3. Choice list. Pattern

The choice lists in the drop-down menus are driven from 2 tables under
the administrator\'s control. This ensures consistency in the lists and
the ability to change these lists without having to intervene on the
files. Similarly, the RegEX rules are driven from a table under the
administrator\'s control. This allows them to be changed if necessary.

## 10.4. RSS

In the base version of SQLPAGE (without scripts), it is not possible to
send notifications to an admin or supervisor from SQLPage from the
creation of a record. The admin must therefore, for example, consult the
list of pending accounts to unlock the rights of new users. To avoid
having to consult this list every hour, RSS feeds have been created in
COOP (folder /a_RSS-feed). The admin can then paste the link into his
Thunderbird-type mail client and he will be informed at the rate he has
set (every hour, once a day, etc.) of a new registration on the site.
The RSS feed configuration files must be coded by hand, but COOP
integrates an RSS module for describing these feeds, which allows them
to be displayed either in the \"about\" menu for general public feeds or
in the admin, supervisor, editor administration panels.

## 10.5 Purging document and image files 

In COOP, it is possible to attach documents to an organization, a
    work group, a building, etc. As a precaution, a limit of 5 MB has
    been set for the size of documents, but the accumulation of all
    documents can unnecessarily load the server in the long run. When
    you delete a record linked to a document, you delete the document
    description metadata but not the file itself. Without a script, it
    is not possible to trigger the deletion of the file at the same time
    as the deletion of the record. To get around the problem, a
    \"files_to_erase\" table has been provided that stores the URLs of
    the files to be deleted. The admin can then periodically purge the
    server of unnecessary files. The procedure has been described, which
    is based on the \"step\" component of SQLPage.
