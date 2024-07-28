<?php
namespace app\models\validacao;

use app\core\Validacao;

class PerfilValidacao{
    public static function salvar($pefil){
        $validacao = new Validacao();
        
        //setando os dados
        $validacao->setData("perfil",$pefil->pefil);        

        //validar os dados
        $validacao->getData("pefil")->isVazio()->isMinimo(5);
       
        return $validacao;
    }
}