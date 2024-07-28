<?php
namespace app\models\dao;

use app\core\Model;

class AulaDetalheClasseDao extends Model {
    public function getDetalhe($id_aula_detalhe) {
        $sql = "SELECT * FROM vw_auladetalhe WHERE id_aula_detalhe = :id_aula_detalhe";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(":id_aula_detalhe", $id_aula_detalhe);
        $stmt->execute();
        return $stmt->fetch(\PDO::FETCH_OBJ);
    }

    public function listaAlunosPorAulaEClasse($id_aula, $id_classe) {
        $sql = "SELECT nome_aluno, presente, id_aluno FROM presenca WHERE id_aula = :id_aula AND id_classe = :id_classe";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(":id_aula", $id_aula);
        $stmt->bindValue(":id_classe", $id_classe);
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_OBJ);
    }

    public function atualizarPresenca($id_aula, $id_classe, $id_aluno, $presente) {
        $sql = "UPDATE presenca SET presente = :presente WHERE id_aula = :id_aula AND id_classe = :id_classe AND id_aluno = :id_aluno";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(":id_aula", $id_aula);
        $stmt->bindValue(":id_classe", $id_classe);
        $stmt->bindValue(":id_aluno", $id_aluno);
        $stmt->bindValue(":presente", $presente);
        return $stmt->execute();
    }
}

?>