<?php
namespace app\models\validacao;

use app\core\Validacao;

class AlunoValidacao{
    public static function salvar($aluno){
        $validacao = new Validacao();
        
        //setando os dados
        $validacao->setData("nome",$aluno->nome);  
        $validacao->setData("data_nasc",$aluno->data_nasc);   


        //validar os dados
        $validacao->getData("nome")->isVazio()->isMinimo(5);
        $validacao->getData("data_nasc")->isVazio();
        
        return $validacao;
    }
}