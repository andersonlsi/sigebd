<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\ClasseService;
use app\models\service\Service;
use stdClass;

class ClasseController extends Controller{  
    
    public function index(){
        $dados["lista"] = Service::getRel(["classe", "faixa_etaria"],["joinCampo" =>"id_faixa_etaria"]); 
        $dados["faixa_etaria"] = Service::lista("faixa_etaria");         
        //i($dados["lista"]);            
        $dados["view"]  = "Classe/Index";
        $this->load("template", $dados);
    } 

    public function create(){ 
        $dados["classe"] = Service::getRel(["classe", "faixa_etaria"],["joinCampo" =>"id_faixa_etaria"]);   
        $dados["faixa_etaria"] = Service::lista("faixa_etaria");       
        $dados["view"]      = "Classe/Create";
        $this->load("template", $dados);
    } 

    public function edit($id_classe){  
        $dados["classe"]    =  Service::get("classe", "id_classe", $id_classe);      
        $dados["view"]      = "Categoria/Create";
        $this->load("template", $dados);
    } 

    public function salvar(){            
        $obj = new stdClass;
        $obj->id_classe        = $_POST["id_classe"] ? $_POST["id_classe"] : null;
        $obj->id_faixa_etaria  = $_POST["id_faixa_etaria"]; 
        $obj->classe           = $_POST["classe"]; 
        $obj->descricao        = $_POST["descricao"];  
        $obj->status           = "A";        
        
       //i($obj);

       Flash::setForm($obj); 
       $resultado = ClasseService::salvar($obj, "id_classe", "classe");

       if($resultado){
         $this->redirect(URL_BASE . "classe");
       }else{
         if($obj->id_classe){
            $this->redirect(URL_BASE . "classe/edit/" . $obj->id_classe);
         }else{
            $this->redirect(URL_BASE . "classe/create");
         }        
       }          
    } 
    
    public function excluir($id_classe) {
        Service::excluir("classe", "id_classe", $id_classe);
        $this->redirect(URL_BASE . "classe");
    }
    
 }
?>