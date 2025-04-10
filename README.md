Hello,

this repo contains an SQLite3 Database about powerlifting exercises, an entity relationship diagram, the database itself and a query file to fill and change the database with different values.
This is a beginners study which shows two fundamental flaws like i now know. Nevertheless i spent hours making this and wont take it down.

1. SQLite3_Design.md gives a brief markdown overview of the design choices and problems that occured with a video link inside for the contained video presentation.
2. SQLite3_schema.sql is the file for creating the initial database.
3. SQLite3_project.db is the database file itself.
4. SQLite3_queries.sql is the file for filling up and changing the contents of the initial database by queries.

The folder also contains the compressed MySQL version of the database (MySQL_Project_Lifting.sql, all in one file) and an UML file to show the links inside the database (MySQL_Project_Lifting_UML.mbw).

To my defense: i made this when i was very new and wanted to understand entities and fundamentals.
I now know that you:
a) shall never use strings in an actual database but instead use IDs for entries like e.g. gender. 
   Parsing, language standards and shear space are a problem otherwise.
b) shall watch out for cross dependencies and use `ON DELETE CASCADE` when necessary to prevent
data junk and lost lost entries when using key bindings. In this case deleting athletes would leave
widow entries in the database for competitions and workouts which is not good for real life applications.

Enjoy!
