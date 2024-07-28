<?php
namespace app\controllers;
use app\core\Controller;
use app\models\service\AulaDetalheClasseService;
use app\util\UtilService;
use stdClass;

class AulaDetalheClasseController extends Controller {

    private $usuario;
    
    public function __construct()
    {
      $this->usuario = UtilService::getUsuario();
         if(!$this->usuario)
         {
            $this->redirect(URL_BASE ."login");      
            exit;	  
         }    
   }
   
    public function index($id_aula_detalhe) {
        $detalhe = AulaDetalheClasseService::getDetalhe($id_aula_detalhe);
        $id_aula = $detalhe->id_aula;
        $id_classe = $detalhe->id_classe;
        
        $lista = AulaDetalheClasseService::listaAlunosPorAulaEClasse($id_aula, $id_classe);
        
        $dados["detalhe"] = $detalhe;
        $dados["lista"] = $lista;
        $dados["view"]  = "AulaDetalheClasse/Index";
        $this->load("template", $dados);
    }

    public function atualizarPresenca() {
        $id_aula = $_POST['id_aula'];
        $id_classe = $_POST['id_classe'];
        $id_aluno = $_POST['id_aluno'];
        $presente = $_POST['presente'];

        $resultado = AulaDetalheClasseService::atualizarPresenca($id_aula, $id_classe, $id_aluno, $presente);
        echo json_encode($resultado);
    }

    public function getListaAlunos($id_aula, $id_classe) {
        $lista = AulaDetalheClasseService::listaAlunosPorAulaEClasse($id_aula, $id_classe);
        echo json_encode($lista);
    }    

    public function salvar() {
        $obj = new stdClass;
        $obj->id_aula_detalhe = $_POST["id_aula_detalhe"];
        $obj->qtde_biblia = $_POST["qtde_biblia"];       
        $obj->qtde_revista = $_POST["qtde_revista"];
        $obj->qtde_visitante = $_POST["qtde_visitante"];
        $obj->valor_oferta = $_POST["valor_oferta"];
        $obj->observacao = $_POST["observacao"];

        AulaDetalheClasseService::salvar($obj);
        $this->redirect(URL_BASE . "aulaDetalheClasse/index/" . $obj->id_aula_detalhe);
    }

    public function buscarAulaDetalheClasse($id_aula_detalhe) {
        $retorno = new stdClass;
        try {
            $detalhe = AulaDetalheClasseService::getDetalhe($id_aula_detalhe);
            $retorno->tem_erro = false;
            $retorno->dados = $detalhe;
        } catch (\Throwable $th) {
            $retorno->tem_erro = true;
            $retorno->msg = $th->getMessage();
        }

        echo json_encode($retorno);
    }
}
?>