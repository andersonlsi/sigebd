<?php
define("ROTA_MANUAL",false);

define("SERVIDOR", "162.241.2.243");
define("BANCO", "ande1305_sigebd_h");
define("USUARIO", "ande1305_sigebd");
define("SENHA", "204060Jolo@#");
define("CHARSET","UTF8");


define('CONTROLLER_PADRAO', 'home');
define('METODO_PADRAO', 'index');
define('NAMESPACE_CONTROLLER', 'app\\controllers\\');
define('TIMEZONE',"America/São Paulo");
define('CAMINHO'            , realpath('./'));
define("TITULO_SITE","SIGEBD - Gestão Escola Dominical");


define('URL_BASE', 'https://' . $_SERVER["HTTP_HOST"].'/sigebd/');
define('URL_IMAGEM', "https://". $_SERVER['HTTP_HOST'] . "/sigebd/assets/UP/");

define("SESSION_LOGIN","usuario_logado");

$config_upload["verifica_extensao"] = false;
$config_upload["extensoes"]         = array(".gif",".jpeg", ".png", ".bmp", ".jpg");
$config_upload["verifica_tamanho"]  = true;
$config_upload["tamanho"]           = 3097152;
$config_upload["caminho_absoluto"]  = realpath('./'). '/';
$config_upload["renomeia"]          = true;