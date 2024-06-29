<?php
namespace app\models\service;

use app\models\validacao\ClasseValidacao;

class ClasseService{
    public static function salvar($classe, $campo, $tabela){
        $validacao = ClasseValidacao::salvar($classe);

        return Service::salvar($classe, $campo, $validacao->listaErros(), $tabela);

    }
    
}  