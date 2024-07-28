<?php
namespace app\models\service;

use app\models\validacao\UsuarioValidacao;

class UsuarioService{
    public static function salvar($usuario, $campo, $tabela){
        $validacao = UsuarioValidacao::salvar($usuario);       
        

        return Service::salvar($usuario, $campo, $validacao->listaErros(), $tabela);

    }
    
}  