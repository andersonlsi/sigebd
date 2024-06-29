<?php
namespace app\models\validacao;

use app\core\Validacao;

class FuncaoValidacao{
    public static function salvar($funcao){
        $validacao = new Validacao();
        
        //setando os dados
        $validacao->setData("funcao",$funcao->funcao);        

        //validar os dados
        $validacao->getData("funcao")->isVazio()->isMinimo(5); //->isUnico();
       
        return $validacao;
    }
}