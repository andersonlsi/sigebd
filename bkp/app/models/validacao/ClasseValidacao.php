<?php
namespace app\models\validacao;

use app\core\Validacao;

class ClasseValidacao{
    public static function salvar($classe){
        $validacao = new Validacao();
        
        //setando os dados
        $validacao->setData("classe",$classe->classe);        

        //validar os dados
        $validacao->getData("classe")->isVazio()->isMinimo(5);
        
        return $validacao;
    }
}