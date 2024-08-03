<?php
namespace app\models\service;
use app\models\dao\AlunoDao;
use app\models\validacao\AlunoValidacao;

class AlunoService{
    public static function salvar($aluno, $campo, $tabela){
        $validacao = AlunoValidacao::salvar($aluno);
        return Service::salvar($aluno, $campo, $validacao->listaErros(), $tabela);
    }

    public static function lista() {
        $dao = new AlunoDao();
        return $dao->lista();
    }  

    public static function classe() {
        $dao = new AlunoDao();
        return $dao->classe();
    }  

    public static function funcao() {
        $dao = new AlunoDao();
        return $dao->funcao();
    }  
    

    
    
}  
