<?php
namespace app\models\validacao;

use app\core\Validacao;

class FaixaEtariaValidacao{
    public static function salvar($faixa_etaria){
        $validacao = new Validacao();
        
        //setando os dados
        $validacao->setData("faixa_etaria",$faixa_etaria->faixa_etaria);        

        //validar os dados
        $validacao->getData("faixa_etaria")->isVazio()->isMinimo(5);
       
        return $validacao;
    }
}