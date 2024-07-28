<?php
namespace app\models\service;

use app\models\validacao\PerfilValidacao;

class PerfilService{
    public static function salvar($pefil, $campo, $tabela){
        $validacao = PerfilValidacao::salvar($pefil);

        return Service::salvar($pefil, $campo, $validacao->listaErros(), $tabela);

    }
    
}  