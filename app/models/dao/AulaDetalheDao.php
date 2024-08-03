<?php
namespace app\models\dao;
use app\core\Model;

class AulaDetalheDao extends Model {
    public function lista($id_aula) {
        $sql = "SELECT * FROM vw_auladetalhe WHERE id_aula = :id_aula";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(":id_aula", $id_aula);
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_OBJ);
    }  
   
    public function lista2($id_aula) {
        $sql = "SELECT id_aula, 
                       total_presenca, 
                       total_falta, 
                       total_biblia, 
                       total_revista, 
                       total_oferta,
                       total_saida,
                       total_final, 
                       total_visitante, 
                       total_matriculado, 
                       observacao 
                FROM view_aula_geral 
                WHERE id_aula = :id_aula";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(":id_aula", $id_aula);
        $stmt->execute();
        return $stmt->fetch(\PDO::FETCH_OBJ);
    }   
    
    public function salvarObservacao($id_aula, $observacao) {
        $sql = "UPDATE aula SET observacao = :observacao WHERE id_aula = :id_aula";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(":observacao", $observacao);
        $stmt->bindValue(":id_aula", $id_aula);
        return $stmt->execute();
    }
    
}
?>