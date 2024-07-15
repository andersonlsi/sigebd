<?php
namespace app\models\validacao;

use app\core\Validacao;

class AulaValidacao{
    public static function salvar($aula){
        $validacao = new Validacao();
        
        //setando os dados
        $validacao->setData("numero",$aula->numero);        

        //validar os dados
        $validacao->getData("numero")->isVazio(); 
        
        return $validacao;
    }
}