<?php
namespace app\models\service;
use app\models\dao\AulaDetalheDao;

class AulaDetalheService {
    public static function lista($id_aula) {
        $dao = new AulaDetalheDao();
        return $dao->lista($id_aula);
    }

    public static function lista2($id_aula) {
        $dao = new AulaDetalheDao();
        return $dao->lista2($id_aula);
    }  
    
    public static function salvarObservacao($id_aula, $observacao) {
        $dao = new AulaDetalheDao();
        return $dao->salvarObservacao($id_aula, $observacao);
    }
}
?>