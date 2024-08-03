<?php
define("ROTA_MANUAL",false);

define("SERVIDOR", "localhost");
define("BANCO", "teste_sigebd");
define("USUARIO", "root");
define("SENHA", "");
define("CHARSET","UTF8");


define('CONTROLLER_PADRAO', 'home');
define('METODO_PADRAO', 'index');
define('NAMESPACE_CONTROLLER', 'app\\controllers\\');
define('TIMEZONE',"America/Fortaleza");
define('CAMINHO'            , realpath('./'));
define("TITULO_SITE","SIGEBD - Gestão Escola Dominical");


define('URL_BASE', 'http://' . $_SERVER["HTTP_HOST"].'/sigebd/');
define('URL_IMAGEM', "http://". $_SERVER['HTTP_HOST'] . "/sigebd/UP/");

define("SESSION_LOGIN","usuario_logado");

$config_upload["verifica_extensao"] = false;
$config_upload["extensoes"]         = array(".gif",".jpeg", ".png", ".bmp", ".jpg");
$config_upload["verifica_tamanho"]  = true;
$config_upload["tamanho"]           = 3097152;
$config_upload["caminho_absoluto"]  = realpath('./'). '/';
$config_upload["renomeia"]          = true;