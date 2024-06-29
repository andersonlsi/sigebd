<?php
namespace app\models\service;

use app\models\validacao\FaixaEtariaValidacao;

class FaixaEtariaService{
    public static function salvar($faixa_etaria, $campo, $tabela){
        $validacao = FaixaEtariaValidacao::salvar($faixa_etaria);

        return Service::salvar($faixa_etaria, $campo, $validacao->listaErros(), $tabela);

    }
    
}  