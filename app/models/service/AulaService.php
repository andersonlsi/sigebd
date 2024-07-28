<?php
namespace app\models\service;
use app\models\dao\AulaDao;

use app\models\validacao\AulaValidacao;

class AulaService{
    public static function salvar($aula, $campo, $tabela){
        $validacao = AulaValidacao::salvar($aula);
        return Service::salvar($aula, $campo, $validacao->listaErros(), $tabela);
    }

    public static function lista() {
        $dao = new AulaDao();
        return $dao->lista();
    }  

    public static function getPresencaFalta($id_aula) {
        $dao = new AulaDao();
        return $dao->getPresencaFalta($id_aula);
    }
    

    public static function existeDataAula($data) {
        $dao = new AulaDao();
        return $dao->existeDataAula($data);
    }
    
}  