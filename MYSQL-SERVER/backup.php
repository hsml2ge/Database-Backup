<?php
date_default_timezone_set("Africa/Lagos");
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$database = 'db_name';
$user = 'username';
$pass = 'password';
$host = 'db_host';
$file = $database . date('Ymd_Hms') . '.sql';
$dir = dirname(__FILE__) . '/RawBackup/' . $file;
exec("mysqldump --user={$user} --password={$pass} --host={$host} {$database} --result-file={$dir} --routines 2>&1", $output);

exit;
