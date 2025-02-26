<?php
define('HOST','localhost');
define('USUARIO','root');
define('SENHA','');
define('DB','dbcrud');

$conection = mysqli_connect(HOST,USUARIO,SENHA,DB);

if(!$conection){
    die("Erro ao conectar ao banco de dados: " . mysqli_connect_error());
}
?>