<?php
namespace app\models\service;

use app\models\validacao\ClasseValidacao;
use app\models\dao\ClasseDao;

class ClasseService {
    public static function salvar($classe, $campo, $tabela) {
        $validacao = ClasseValidacao::salvar($classe);
        return Service::salvar($classe, $campo, $validacao->listaErros(), $tabela);
    }

    public static function podeExcluir($id_classe) {
        $classeDao = new ClasseDao();
        return $classeDao->podeExcluir($id_classe);
    }
}