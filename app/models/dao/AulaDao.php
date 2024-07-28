<?php
namespace app\models\dao;

use app\core\Model;

class AulaDao extends Model{
    public function lista(){
        $sql = "SELECT * FROM aula order by dta_aula desc";
        return $this->select($this->db, $sql);
    } 

    public function getPresencaFalta($id_aula) {
        $sql = "SELECT total_presenca, total_falta, total_matriculado FROM view_aula_geral WHERE id_aula = :id_aula";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(":id_aula", $id_aula);
        $stmt->execute();
        return $stmt->fetch(\PDO::FETCH_OBJ);
    }    
    
    
    public function existeDataAula($data) {
        $sql = "SELECT COUNT(*) as total FROM aula WHERE dta_aula = :data";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(":data", $data);
        $stmt->execute();
        $result = $stmt->fetch(\PDO::FETCH_ASSOC);
        return $result['total'] > 0;
    }
    
}