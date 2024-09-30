<?php
$file = './input.txt';

try {
    $data = file_get_contents($file);
    $lines = explode("\n", $data);

    foreach ($lines as $line) {
        echo trim($line) . "\n";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
