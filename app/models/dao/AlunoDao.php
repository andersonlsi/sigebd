<?php
namespace app\models\dao;

use app\core\Model;

class AlunoDao extends Model{
    public function lista(){
        $sql = "SELECT * FROM vw_aluno";
        return $this->select($this->db, $sql);
    }

    public function classe(){
        $sql = "SELECT * FROM classe";
        return $this->select($this->db, $sql);
    }

    public function funcao(){
        $sql = "SELECT * FROM funcao";
        return $this->select($this->db, $sql);
    }

}