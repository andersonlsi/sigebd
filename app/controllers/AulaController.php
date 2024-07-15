<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\AulaService;
use app\models\service\Service;
use stdClass;

class AulaController extends Controller{  
    
    public function index(){       
        $dados["lista"] = AulaService::lista("aula");                      
        $dados["view"]  = "Aula/Index";
        $this->load("template", $dados);
    }  
    
    // public function viewClass($id_categoria){  
    //     $dados["categoria"] =  Service::get("categoria", "id_categoria", $id_categoria);      
    //     $dados["view"]      = "Categoria/Create";
    //     $this->load("template", $dados);
    // } 
    
    public function salvar(){            
        $obj            = new stdClass;
        $obj->id_Aula   = $_POST["id_aula"];         
        $obj->data_aula = $_POST["data_aula"];  
        $obj->numero    = $_POST["numero"];  
   
       Flash::setForm($obj);        
      
      // Verifica se já existe aula com a mesma data
      if (AulaService::existeDataAula($obj->data_aula)) {
        Flash::setMsg("Já existe uma aula cadastrada com esta data", 2);      
        $this->redirect(URL_BASE . "aula");
        return;
       }

        AulaService::salvar($obj, "id_aula", "aula");
        $this->redirect(URL_BASE . "aula");             
    } 
    
    public function excluir($id_Aula) {
        Service::excluir("Aula", "id_Aula", $id_Aula);
        $this->redirect(URL_BASE . "Aula");
    }    
 }
?>