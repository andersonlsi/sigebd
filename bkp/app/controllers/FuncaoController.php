<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\FuncaoService;
use app\models\service\Service;
use stdClass;

class FuncaoController extends Controller{  
    
    public function index(){
        $dados["lista"] = Service::lista("funcao"); 
        //i($dados["lista"]);            
        $dados["view"]  = "Funcao/Index";
        $this->load("template", $dados);
    } 

    public function create(){   
        $dados["funcao"] = Flash::getForm();         
        $dados["view"]   = "Funcao/Create";
        $this->load("template", $dados);
    } 

    public function edit($id_funcao){  
        $dados["funcao"] =  Service::get("funcao", "id_funcao", $id_funcao);      
        $dados["view"]   = "Funcao/Create";
        $this->load("template", $dados);
    } 

    public function salvar(){            
        $obj = new stdClass;
        $obj->id_funcao = $_POST["id_funcao"] ? $_POST["id_funcao"] : null;
        $obj->funcao    = $_POST["funcao"];    
        $obj->status    = "A";

       //i($obj);

       Flash::setForm($obj); 
       $resultado = FuncaoService::salvar($obj, "id_funcao", "funcao");

       if($resultado){
         $this->redirect(URL_BASE . "funcao");
       }else{
         if($obj->id_funcao){
            $this->redirect(URL_BASE . "funcao/edit/" . $obj->id_funcao);
         }else{
            $this->redirect(URL_BASE . "funcao/create");
         }        
       }          
    } 
    
    public function excluir($id_funcao) {
        Service::excluir("funcao", "id_funcao", $id_funcao);
        $this->redirect(URL_BASE . "Funcao");
    }
    
 }
?>