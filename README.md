## MYSQL & MSSQL DATABASE-BACKUP WITH PHP & WINDOWS
Database backup is the process of backing up the operational state, architecture and stored data of database software. It enables the creation of a duplicate instance or copy of a database in case the primary database crashes, is corrupted or is lost. Many developers have complaint about ways to take full backup of their database. I believe this solution should solve their problem.

### WINDOWS MSSQL SERVER
  To auto generate backup for mssql server, the following steps should be followed.
  * Install 7z on your computer
  * Click MSSQL-SERVER folder and MSSQL_SERVER.bat
  * Copy the content of MSSQL_SERVER.bat
  * In the folder you want to store your backup create a file backup.bat [or any name of your chosen] and paste the contents of MSSQL_SERVER.bat into the file.
  * Edit the content to match your mssql server and database details
  * Double click the file to execute it. if the database backup is successful then use your windows scheduler to schedule your times of execution. Otherwise scan through the file and make sure all your parameters are accurate.
### MYSQL-SERVER
