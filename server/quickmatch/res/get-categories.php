<?php

/**
 * @author Ravi Tamada
 * @link http://www.androidhive.info/2012/01/android-login-and-registration-with-php-mysql-and-sqlite/ Complete tutorial
 */

require_once 'connect.php';
$this->conn->query("SELECT * FROM categorias c, tipo_neg n where c.idtiponeg = n.idtiponeg");

?>