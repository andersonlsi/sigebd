<?php
namespace app\models\validacao;

use app\core\Validacao;

class PermissaoValidacao{
    public static function salvar($permissao){
        $validacao = new Validacao();
        
        //setando os dados
        $validacao->setData("perfil",$permissao->permissao);        

        //validar os dados
        $validacao->getData("permissao")->isVazio()->isMinimo(5);
       
        return $validacao;
    }
}