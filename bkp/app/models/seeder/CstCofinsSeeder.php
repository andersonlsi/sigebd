<?php
namespace app\models\seeder;

class CstCofinsSeeder 
{       
        public $tabela = 'estado';
        public $dados = [
            ['cst'=>'01', 'tipo'=>'S', 'descricao'     => '01: Operação tributável Cfop::firstOrCreate( Operação alíq. normal Cfop::firstOrCreate(cumul./não cumul.)'],
            ['cst'=>'02', 'tipo'=>'S', 'descricao'     => '02: Operação tributável Cfop::firstOrCreate(valor da operação Cfop::firstOrCreate(alíquota diferenciada)'],
            ['cst'=>'03', 'tipo'=>'S', 'descricao'     => '03: Operação tributável Cfop::firstOrCreate(quant. x alíq. por unidade de produto)'],
            ['cst'=>'04', 'tipo'=>'S', 'descricao'     => '04: Operação tributável Cfop::firstOrCreate(tributação monofásica, alíquota zero)'],
            ['cst'=>'06', 'tipo'=>'S', 'descricao'     => '06: Operação tributável Cfop::firstOrCreate(alíquota zero)'],
            ['cst'=>'07', 'tipo'=>'S', 'descricao'     => '07: Operação isenta da contribuição'],
            ['cst'=>'08', 'tipo'=>'S', 'descricao'     => '08: Operação sem incidência da contribuição'],
            ['cst'=>'09', 'tipo'=>'S', 'descricao'     => '09: Operação com suspensão da contribuição'],
            ['cst'=>'49', 'tipo'=>'S', 'descricao'     => '49: Outras Operações de Saída'],
            ['cst'=>'50', 'tipo'=>null, 'descricao'     => '50: Direito a Crédito. Vinculada Exclusivamente a Receita Tributada no Mercado Interno'],
            ['cst'=>'51', 'tipo'=>null, 'descricao'     => '51: Direito a Crédito. Vinculada Exclusivamente a Receita Não Tributada no Mercado Interno'],
            ['cst'=>'52', 'tipo'=>null, 'descricao'     => '52: Direito a Crédito. Vinculada Exclusivamente a Receita de Exportação'],
            ['cst'=>'53', 'tipo'=>null, 'descricao'     => '53: Direito a Crédito. Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno'],
            ['cst'=>'54', 'tipo'=>null, 'descricao'     => '54: Direito a Crédito. Vinculada a Receitas Tributadas no Mercado Interno e de Exportação'],
            ['cst'=>'55', 'tipo'=>null, 'descricao'     => '55: Direito a Crédito. Vinculada a Receitas Não-Trib. no Mercado Interno e de Exportação'],
            ['cst'=>'56', 'tipo'=>null, 'descricao'     => '56: Direito a Crédito. Vinculada a Rec. Trib. e Não-Trib. Mercado Interno e Exportação'],
            ['cst'=>'60', 'tipo'=>null, 'descricao'     => '60: Créd. Presumido. Aquisição Vinc. Exclusivamente a Receita Tributada no Mercado Interno'],
            ['cst'=>'61', 'tipo'=>null, 'descricao'     => '61: Créd. Presumido. Aquisição Vinc. Exclusivamente a Rec. Não-Trib. no Mercado Interno'],
            ['cst'=>'62', 'tipo'=>null, 'descricao'     => '62: Créd. Presumido. Aquisição Vinc. Exclusivamente a Receita de Exportação'],
            ['cst'=>'63', 'tipo'=>null, 'descricao'     => '63: Créd. Presumido. Aquisição Vinc. a Rec. Trib. e Não-Trib. no Mercado Interno'],
            ['cst'=>'64', 'tipo'=>null, 'descricao'     => '64: Créd. Presumido. Aquisição Vinc. a Rec. Trib. no Mercado Interno e de Exportação'],
            ['cst'=>'65', 'tipo'=>null, 'descricao'     => '65: Créd. Presumido. Aquisição Vinc. a Rec. Não-Trib. Mercado Interno e Exportação'],
            ['cst'=>'66', 'tipo'=>null, 'descricao'     => '66: Créd. Presumido. Aquisição Vinc. a Rec. Trib. e Não-Trib. Mercado Interno e Exportação'],
            ['cst'=>'67', 'tipo'=>null, 'descricao'     => '67: Crédito Presumido - Outras Operações'],
            ['cst'=>'70', 'tipo'=>null, 'descricao'     => '70: Operação de Aquisição sem Direito a Crédito'],
            ['cst'=>'71', 'tipo'=>null, 'descricao'     => '71: Operação de Aquisição com Isenção'],
            ['cst'=>'72', 'tipo'=>null, 'descricao'     => '72: Operação de Aquisição com Suspensão'],
            ['cst'=>'73', 'tipo'=>null, 'descricao'     => '73: Operação de Aquisição a Alíquota Zero'],
            ['cst'=>'74', 'tipo'=>null, 'descricao'     => '74: Operação de Aquisição sem Incidência da Contribuição'],
            ['cst'=>'75', 'tipo'=>null, 'descricao'     => '75: Operação de Aquisição por Substituição Tributária'],
            ['cst'=>'98', 'tipo'=>null, 'descricao'     => '98: Outras Operações de Entrada'],
            ['cst'=>'99', 'tipo'=>null, 'descricao'     => '99: Outras operações'],
    ];
}

