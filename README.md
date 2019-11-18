## MYSQL & MSSQL DATABASE-BACKUP WITH PHP & WINDOWS
Database backup is the process of backing up the operational state, architecture and stored data of database software. It enables the creation of a duplicate instance or copy of a database in case the primary database crashes, corrupted or lost. Many developers have complaint about ways to take full backup of their database. I believe this solution should solve their problem.

### WINDOWS MSSQL SERVER
  To auto generate backup for mssql server, the following steps should be followed:
  * Install 7z on your computer
  * Click MSSQL-SERVER folder here on github and MSSQL_SERVER.bat
  * Copy the content of MSSQL_SERVER.bat
  * In the folder you want to store your backup create a file backup.bat [or any name of your chosen] and paste the contents of MSSQL_SERVER.bat into the file.
  * Edit the content to match your mssql server and database details
  * Double click the file to execute it. if the database backup is successful then use your windows scheduler to schedule your times of execution. Otherwise scan through the file and make sure all your parameters are accurate.
### MYSQL-SERVER
  To auto generate backup for mysql database, the following steps should be followed:
  * Download this project and delete the MSSQL-SERVER part as you don't need it
  * Copy the MYSQL-SERVER part to your local/remote web host
  * On your webhost Create a folder to store your backups if [RawBackup] doesnt exists
  * Open the backup.php file, edit to your timezone, and change the parameters of the variable to match your db credentials and save
  ```php
    date_default_timezone_set("Africa/Lagos");
    $database = 'db_name';
    $user = 'username';
    $pass = 'password';
    $host = 'db_host';
  ```
  * Execute the file and check if the raw .sql file is created.
  * If the .sql creation is not successful then browse through the backup file and make sure everything there matches your database credentials and try again.
  * If the backup is successful then you can open your zipped.php to zip your file. this is to minimize disk space
#### SET UP CRONJOB OR SCHEDULER FOR MYSQL DB BACKUP
  Upon successful backup the need for automating the backup process comes into play:
  * For remote webhost just create a CRONJOB to take backup, and another to zip the file and delete the row file
  * For local you need to setup  a SCHEDULER that will take backup, and another to zip the file and delete the row file
