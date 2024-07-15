<?php
namespace app\models\dao;

use app\core\Model;

class AulaDao extends Model{
    public function lista(){
        $sql = "SELECT * FROM aula order by data_aula desc";
        return $this->select($this->db, $sql);
    } 
    
    public function existeDataAula($data) {
        $sql = "SELECT COUNT(*) as total FROM aula WHERE data_aula = :data";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(":data", $data);
        $stmt->execute();
        $result = $stmt->fetch(\PDO::FETCH_ASSOC);
        return $result['total'] > 0;
    }

    // public function verificaConfiguracao() {
    //     $sql = "SELECT valor, tempo FROM configuracao WHERE tipo = 'Cadastro Aula' AND evento = 'Delete'";
    //     return $this->select($this->db, $sql);
    // }

    // public function getById($id_Aula) {
    //     $sql = "SELECT * FROM aula WHERE id_aula = $id_Aula";
    //     return $this->select($this->db, $sql);
    // }
}