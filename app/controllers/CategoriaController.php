<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\CategoriaService;
use app\models\service\Service;
use app\util\UtilService;
use stdClass;

class CategoriaController extends Controller{  

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
    
    public function index(){
        $dados["lista"] = Service::lista("categoria"); 
        //i($dados["lista"]);            
        $dados["view"]  = "Categoria/Index";
        $this->load("template", $dados);
    } 

    public function create(){   
        $dados["categoria"] = Flash::getForm();         
        $dados["view"]      = "Categoria/Index";
        $this->load("template", $dados);
    } 

    public function edit($id_categoria){  
        $dados["categoria"] =  Service::get("categoria", "id_categoria", $id_categoria);      
        $dados["view"]      = "Categoria/Index";
        $this->load("template", $dados);
    } 

    public function salvar(){            
        $obj = new stdClass;
        $obj->id_categoria = $_POST["id_categoria"] ? $_POST["id_categoria"] : null;
        $obj->categoria    = $_POST["categoria"];    
        $obj->status       = "A";

       //i($obj);

       Flash::setForm($obj); 
       $resultado = CategoriaService::salvar($obj, "id_categoria", "categoria");

       if($resultado){
         $this->redirect(URL_BASE . "categoria");
       }else{
         if($obj->id_categoria){
            $this->redirect(URL_BASE . "categoria/edit/" . $obj->id_categoria);
         }else{
            $this->redirect(URL_BASE . "categoria/Index");
         }        
       }          
    } 

    public function buscarCategoria($id_categoria){
        $retorno = new stdClass;
        try {
            $categoria = Service::get("categoria","id_categoria", $id_categoria);
            $retorno->tem_erro = false;
            $retorno->dados = $categoria;
        } catch (\Throwable $th) {
            $retorno->tem_erro = true;
            $retorno->msg = $th->getMessage();
        }

        echo json_encode($retorno);
    }
    
    public function excluir($id_categoria) {
        Service::excluir("categoria", "id_categoria", $id_categoria);
        $this->redirect(URL_BASE . "categoria");
    }
    
}
?>