<?php

require_once 'app/core/Core.php';
require_once 'app/helper/helper.php';
require_once 'app/helper/datahora.php';
require_once 'app/helper/numero.php';
require_once 'app/helper/rede.php';
require_once 'app/helper/string.php';
require_once 'config/config.php';
require 'vendor/autoload.php';

use app\core\Seeder;


$seeder     = new Seeder();

$command    = $argv[1] ?? null;
$name       = $argv[2] ?? null;


switch ($command) {
    case 'limpa':
        if ($name) {
            if (class_exists("app\\models\\seeder\\{$name}")) {
                // Executa um seeder específico
                $seeder->limparTabela($name);
                echo "Tabela '{$name}' limpa.\n";
            } else {
                echo "Seeder '{$name}' não encontrado.\n";
            }
        }else {
            // Limpa todas as tabelas
            $seeder->limpa();
            echo "Todas as tabelas limpas.\n";
        }
        break;

    case 'seed':
        if ($name) {
            if (class_exists("app\\models\\seeder\\{$name}")) {
                // Executa um seeder específico
                $seeder->runEspecifico("{$name}");
                echo "Seeder '{$name}' executado com sucesso.\n";
            } else {
                echo "Seeder '{$name}' não encontrado.\n";
            }
        } else {
            // Executa todos os seeders
            $seeder->run();
            echo "Todos os seeders executados com sucesso.\n";
        }
        break;

    case null:
            // Executa todos os seeders
            $seeder->run();
            echo "Todos os seeders executados com sucesso.\n";        
            break;

    default:
        echo "Comando desconhecido. Use:\n";
        echo "   php seed.php seed [nome_do_seeder] - Para executar um seeder específico.\n";
        echo "   php seed.php limpa [nome_da_tabela] - Para limpar uma tabela específica.\n";
        echo "   php seed.php limpa - Para limpar todas as tabelas.\n";
        echo "   php seed.php seed - Para executar todos os seeders.\n";
        break;
}
