<?php
namespace app\models\service;
use app\models\dao\AulaDetalheClasseDao;

use app\models\validacao\AulaDetalheClasseValidacao;

class AulaDetalheClasseService {
    public static function getDetalhe($id_aula_detalhe) {
        $dao = new AulaDetalheClasseDao();
        return $dao->getDetalhe($id_aula_detalhe);
    }

    public static function salvar($detalhe) {
        $validacao = AulaDetalheClasseValidacao::salvar($detalhe);
        return Service::salvar($detalhe, "id_aula_detalhe", $validacao->listaErros(), "aula_detalhe");
    }

    public static function listaAlunosPorAulaEClasse($id_aula, $id_classe) {
        $dao = new AulaDetalheClasseDao();
        return $dao->listaAlunosPorAulaEClasse($id_aula, $id_classe);
    }

    public static function atualizarPresenca($id_aula, $id_classe, $id_aluno, $presente) {
        $dao = new AulaDetalheClasseDao();
        return $dao->atualizarPresenca($id_aula, $id_classe, $id_aluno, $presente);
    }
}
?>