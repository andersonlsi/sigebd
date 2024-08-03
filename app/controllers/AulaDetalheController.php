<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\AulaDetalheService;
use app\models\service\Service;
use app\util\UtilService;

class AulaDetalheController extends Controller {  
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
    public function index($id_aula) {
        $dados["detalhes"] = AulaDetalheService::lista($id_aula);        
        $dados["geral"]    = AulaDetalheService::lista2($id_aula);
        $dados["categorias"] = Service::lista("categoria");                     
        $dados["view"]     = "AulaDetalhe/Index";
        $this->load("template", $dados);
    }  
    
    public function salvarObservacao() {
        $id_aula    = $_POST['id_aula'];
        $observacao = $_POST['observacao'];
        
        $result = AulaDetalheService::salvarObservacao($id_aula, $observacao);
        
        if($result) {
            Flash::setMsg("Registro salvo com sucesso", 1);
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false]);
        }
    }

    // PRECISA ALTERAR PARA FUNCIONAR(FASE DE DESENVOLVIMENTO)
    public function salvarSaida() {
        $id_aula    = $_POST['id_aula'];
        $observacao = $_POST['observacao'];
        
        $result = AulaDetalheService::salvarObservacao($id_aula, $observacao);
        
        if($result) {
            Flash::setMsg("Registro salvo com sucesso", 1);
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false]);
        }
    }
    
}
?>