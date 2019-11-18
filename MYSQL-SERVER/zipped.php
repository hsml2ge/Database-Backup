<?php
$dir = array_diff(scandir(dirname(__FILE__) . '/RawBackup/'), ['.', '..']);
if (!empty($dir)) {
    foreach ($dir as $file) {
        $exp = explode('.', $file);
        if (file_exists(dirname(__FILE__) . "/ZippedBackup/" . current($exp) . '.zip')) {
            unlink(dirname(__FILE__) . "/RawBackup/" . current($exp) . '.sql');
        }else{
            $zip = new ZipArchive();

            $name = dirname(__FILE__) . "/ZippedBackup/".current($exp).'.zip';

            $zip->open($name,ZipArchive::CREATE);

            $zip->addFile( dirname(__FILE__) . "/RawBackup/" . current($exp) . '.sql', $file);

            $zip->close();

            if (file_exists(dirname(__FILE__) . "/ZippedBackup/" . current($exp) . '.zip')) {
                unlink(dirname(__FILE__) . "/RawBackup/" . current($exp) . '.sql');
            }
        }
    }
}
