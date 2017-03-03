<?php

DEFINE ('DB_USER', 'app_user');
DEFINE ('DB_PASSWORD', 'admin1234');
DEFINE ('DB_HOST', 'localhost');
DEFINE ('DB_NAME', 'city_inhabitants');

$dbc = @mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME)
OR die('Could not connect to MySQL ' .
        mysqli_connect_error());

 ?>
