<?php
namespace app\models\dao;

use app\core\Model;

class ClasseDao extends Model {
    public function lista() {
        $sql = "SELECT * FROM classe";
        return $this->select($this->db, $sql);
    }

    public function podeExcluir($id_classe) {
        $tables = ['aluno', 'presenca', 'aula_detalhe'];
        foreach ($tables as $table) {
            $sql = "SELECT COUNT(*) as total FROM $table WHERE id_classe = :id_classe";
            $stmt = $this->db->prepare($sql);
            $stmt->bindParam(':id_classe', $id_classe);
            $stmt->execute();
            $result = $stmt->fetch();
            if ($result['total'] > 0) {
                return false;
            }
        }
        return true;
    }
}