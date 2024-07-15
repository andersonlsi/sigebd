<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\AulaService;
use app\models\service\Service;
use stdClass;

class AulaController extends Controller{  
    
    public function index(){
        $dados["lista"] = Service::lista("aula"); 
        //i($dados["lista"]);            
        $dados["view"]  = "Aula/Index";
        $this->load("template", $dados);
    } 

    public function create(){   
        $dados["aula"]      = Flash::getForm();         
        $dados["view"]      = "Aula/Create";
        $this->load("template", $dados);
    } 

    public function edit($id_aula){  
        $dados["aula"] =  Service::get("aula", "id_aula", $id_aula);      
        $dados["view"]      = "Aula/Create";
        $this->load("template", $dados);
    } 

    public function salvar(){            
        $obj            = new stdClass;
        $obj->id_Aula   = $_POST["id_aula"] ? $_POST["id_aula"] : null;
        $obj->numero    = $_POST["numero"];   
        $obj->data      = $_POST["data"];         

       //i($obj);

       Flash::setForm($obj); 
       $resultado = AulaService::salvar($obj, "id_aula", "aula");

       if($resultado){
         $this->redirect(URL_BASE . "aula");
       }else{
         if($obj->id_Aula){
            $this->redirect(URL_BASE . "aula/edit/" . $obj->id_aula);
         }else{
            $this->redirect(URL_BASE . "aula/create");
         }        
       }          
    } 
    
    public function excluir($id_Aula) {
        Service::excluir("Aula", "id_Aula", $id_Aula);
        $this->redirect(URL_BASE . "Aula");
    }
    
 }
?>