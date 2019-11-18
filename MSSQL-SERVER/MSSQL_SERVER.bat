
:: -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: TURN OFF ECHO COMMANT

echo off

:: -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: CLEAR DOS SCREEN

cls

:: -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: SET SERVER NAME WHEN SETTING THE SERVER NAME MAKE SURE TO REMOVE THE SQAUREBRACKETS

set SERVERNAME=[SERVERNAME]

:: -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: SET DATABASE NAME WHEN SETTING THE DATABASE NAME MAKE SURE TO REMOVE THE SQAUREBRACKETS

set DATABASENAME=[DATABASENAME]

:: -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: ADD 0 TO CURRENT TIME, EXAMPLE 9:00AM WILL BE 09:00AM

set MyTime=%TIME: =0%

:: -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: GENERATE THE DATE AND TIME OF THE GENERATION WHICH WILL BE ADDED TO THE FILE NAME

set MyDate=%DATE:~-4%.%DATE:~7,2%.%DATE:~4,2%.%MyTime:~0,2%.%MyTime:~3,2%.%MyTime:~6,2%

:: -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: CONCATENATE THE DATABASE NAME AND DATE TO CREATE THE FILE NAME

set FileName=%DATABASENAME%_%MyDate%.bak

:: -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: SET SYSTEM TO THE BACKUP DIRECTORY
:: Path C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Backup\
set BAK_PATH=[PATH]

:: -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: SET THE DESTINATION FILE NAME AND DIRECTORY

set DEST_FILE=%BAK_PATH%%FileName%

:: -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: GENERATE THE SQL BACKUP FILE IN THE DESTINATION DIRECTORY

sqlcmd -E  -S %SERVERNAME% -d master -Q "BACKUP DATABASE [%DATABASENAME%] TO DISK = N'%DEST_FILE%' WITH INIT, NOUNLOAD, NAME = N'%DATABASENAME% backup', NOSKIP,  NOFORMAT"

:: -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: ZIP THE SQL GENERATED FILE

7z a -tzip "%DEST_FILE%.zip" "%DEST_FILE%"

:: -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: DELETE THE UNZIP FILE AND END THE PROCESS

DEL "%DEST_FILE%"