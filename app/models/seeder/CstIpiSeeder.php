<?php

namespace app\models\seeder;

class CstIpiSeeder 
{
    public $tabela = 'estado';
    public $dados = [
        ['cst' =>'00',  'tipo'=>'E',		'descricao'     =>'00: Entrada com recuperação de crédito'],
        ['cst' =>'01',  'tipo'=>'E',		'descricao'     =>'01: Entrada tributada com alíquota zero'],
        ['cst' =>'02',  'tipo'=>'E',		'descricao'     =>'02: Entrada isenta'],
        ['cst' =>'03',  'tipo'=>'E',		'descricao'     =>'03: Entrada não-tributada'],
        ['cst' =>'04',  'tipo'=>'E',		'descricao'     =>'04: Entrada imune'],
        ['cst' =>'05',  'tipo'=>'E',		'descricao'     =>'05: Entrada com suspensão'],
        ['cst' =>'49',  'tipo'=>'E',		'descricao'     =>'49: Outras entradas'],
        ['cst' =>'50',  'tipo'=>'S',		'descricao'     =>'50: Saída tributada'],
        ['cst' =>'51',  'tipo'=>'S',		'descricao'     =>'51: Saída tributada com alíquota zero'],
        ['cst' =>'52',  'tipo'=>'S',		'descricao'     =>'52: Saída isenta'],
        ['cst' =>'53',  'tipo'=>'S',		'descricao'     =>'53: Saída não-tributada'],
        ['cst' =>'54',  'tipo'=>'S',		'descricao'     =>'54: Saída imune'],
        ['cst' =>'55',  'tipo'=>'S',		'descricao'     =>'55: Saída com suspensão'],
        ['cst' =>'99',  'tipo'=>'S',		'descricao'     =>'99: Outras saídas'],
    ];
}
