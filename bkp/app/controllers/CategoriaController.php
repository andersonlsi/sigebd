<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\CategoriaService;
use app\models\service\Service;
use stdClass;

class CategoriaController extends Controller{  
    
    public function index(){
        $dados["lista"] = Service::lista("categoria"); 
        //i($dados["lista"]);            
        $dados["view"]  = "Categoria/Index";
        $this->load("template", $dados);
    } 

    public function create(){   
        $dados["categoria"] = Flash::getForm();         
        $dados["view"]      = "Categoria/Create";
        $this->load("template", $dados);
    } 

    public function edit($id_categoria){  
        $dados["categoria"] =  Service::get("categoria", "id_categoria", $id_categoria);      
        $dados["view"]      = "Categoria/Create";
        $this->load("template", $dados);
    } 

    public function salvar(){            
        $obj = new stdClass;
        $obj->id_categoria = $_POST["id_categoria"] ? $_POST["id_categoria"] : null;
        $obj->categoria    = $_POST["categoria"];            

       //i($obj);

       Flash::setForm($obj); 
       $resultado = CategoriaService::salvar($obj, "id_categoria", "categoria");

       if($resultado){
         $this->redirect(URL_BASE . "categoria");
       }else{
         if($obj->id_categoria){
            $this->redirect(URL_BASE . "categoria/edit/" . $obj->id_categoria);
         }else{
            $this->redirect(URL_BASE . "categoria/create");
         }        
       }          
    } 
    
    public function excluir($id_categoria) {
        Service::excluir("categoria", "id_categoria", $id_categoria);
        $this->redirect(URL_BASE . "categoria");
    }
    
 }
?>