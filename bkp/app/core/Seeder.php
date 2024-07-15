<?php
namespace app\core;

use app\models\seeder\Database;
use app\models\service\Service;

class Seeder
{
    public function run()
    {
        $seeders = Database::getSeeders();
        foreach ($seeders as $seederClass) {
            $seeder = new $seederClass();
            $this->seed($seeder->tabela, $seeder->dados);
        }
    }

    public function runEspecifico($seederName)
    {
        $seeders = Database::getSeeders();
        $seederNameWithoutExtension = pathinfo($seederName, PATHINFO_FILENAME); // Extrai o nome do arquivo sem a extensão .php
       
        // Verifica se o nome do arquivo (sem extensão) está presente nos seeders
        $seederFound = false;
        foreach ($seeders as $seeder) {
           
            if ($seederNameWithoutExtension === pathinfo($seeder, PATHINFO_FILENAME)) {
                $seederFound = true;
                break;
            }
        }
       
        if ($seederFound) {          
            $seederClass = "app\\models\\seeder\\{$seederNameWithoutExtension}";
            $seeder = new $seederClass();
            $this->seed($seeder->tabela, $seeder->dados);
            echo "Seeder '{$seederNameWithoutExtension}' executado com sucesso.\n";
        } else {
            echo "Seeder '{$seederNameWithoutExtension}' não encontrado.\n";
        }
    }


    public function limparTabela($seederName)
    {
        $seeders = Database::getSeeders();
        $seederNameWithoutExtension = pathinfo($seederName, PATHINFO_FILENAME); // Extrai o nome do arquivo sem a extensão .php
       
        // Verifica se o nome do arquivo (sem extensão) está presente nos seeders
        $seederFound = false;
        foreach ($seeders as $seeder) {           
            if ($seederNameWithoutExtension === pathinfo($seeder, PATHINFO_FILENAME)) {
                $seederFound = true;
                break;
            }
        }
       
        if ($seederFound) {          
            $seederClass = "app\\models\\seeder\\{$seederNameWithoutExtension}";
            $seeder = new $seederClass();
            $this->limpar($seeder->tabela);
            echo "Seeder '{$seederNameWithoutExtension}' executado com sucesso.\n";
        } else {
            echo "Seeder '{$seederNameWithoutExtension}' não encontrado.\n";
        }
    }

 

    public function limpa()
    {
        $seeders = Database::getSeeders();        
        foreach ($seeders as $seederClass) {
            $seeder = new $seederClass();
            $this->limpar($seeder->tabela);
        }
    }

    private function seed($tabela, $dados)
    {
        foreach ($dados as $data) {
            Service::inserir($data, $tabela);
        }
    }
    

    private function limpar($tabela)
    {
        Service::limparTabela($tabela);
    }
}

