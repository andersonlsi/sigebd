<?php

namespace app\models\seeder;

class StatusSeeder 
{
    public $tabela = 'status'; 
    public $dados = array();

    public function __construct()
    {        
        foreach (config("constantes.status") as $chave => $valor) {
            $this->dados[] = [
                'status'    => $chave,
                'descricao' => $valor, // Aqui você pode querer usar $valor ao invés de $chave
            ];
        }
    }

}
