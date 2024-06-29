<?php
namespace app\models\validacao;

use app\core\Validacao;

class CategoriaValidacao{
    public static function salvar($categoria){
        $validacao = new Validacao();
        
        //setando os dados
        $validacao->setData("categoria",$categoria->categoria);        

        //validar os dados
        $validacao->getData("categoria")->isVazio()->isMinimo(5);
        
        return $validacao;
    }
}