<?php
namespace app\models\service;

use app\models\validacao\FuncaoValidacao;

class FuncaoService{
    public static function salvar($funcao, $campo, $tabela){
        $validacao = FuncaoValidacao::salvar($funcao);

        return Service::salvar($funcao, $campo, $validacao->listaErros(), $tabela);

    }
    
}  