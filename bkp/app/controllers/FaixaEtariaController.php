<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\FaixaEtariaService;
use app\models\service\Service;
use stdClass;

class FaixaEtariaController extends Controller{  
    
    public function index(){
        $dados["lista"] = Service::lista("faixa_etaria"); 
        //i($dados["lista"]);            
        $dados["view"]  = "FaixaEtaria/Index";
        $this->load("template", $dados);
    } 

    public function create(){   
        $dados["faixa_etaria"] = Flash::getForm();         
        $dados["view"]   = "FaixaEtaria/Create";
        $this->load("template", $dados);
    } 

    public function edit($id_faixa_etaria){  
        $dados["faixa_etaria"] =  Service::get("faixa_etaria", "id_faixa_etaria", $id_faixa_etaria);      
        $dados["view"]   = "FaixaEtaria/Create";
        $this->load("template", $dados);
    } 

    public function salvar(){            
        $obj = new stdClass;
        $obj->id_faixa_etaria = $_POST["id_faixa_etaria"] ? $_POST["id_faixa_etaria"] : null;
        $obj->faixa_etaria    = $_POST["faixa_etaria"];    
        $obj->status          = "A";

       //i($obj);

       Flash::setForm($obj); 
       $resultado = FaixaEtariaService::salvar($obj, "id_faixa_etaria", "faixa_etaria");

       if($resultado){
         $this->redirect(URL_BASE . "FaixaEtaria");
       }else{
         if($obj->id_funcao){
            $this->redirect(URL_BASE . "faixa_etaria/edit/" . $obj->id_faixa_etaria);
         }else{
            $this->redirect(URL_BASE . "faixa_etaria/create");
         }        
       }          
    } 
    
    public function excluir($id_faixa_etaria) {
        Service::excluir("faixa_etaria", "id_faixa_etaria", $id_faixa_etaria);
        $this->redirect(URL_BASE . "FaixaEtaria");
    }
    
 }
?>