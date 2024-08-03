<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\FaixaEtariaService;
use app\models\service\Service;
use app\util\UtilService;
use stdClass;

class FaixaEtariaController extends Controller{  
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
        $dados["lista"] = Service::lista("faixa_etaria");                   
        $dados["view"]  = "FaixaEtaria/Index";
        $this->load("template", $dados);
    } 

    public function create(){   
        $dados["faixa_etaria"] = Flash::getForm();         
        $dados["view"]         = "FaixaEtaria/Index";
        $this->load("template", $dados);
    } 

    public function edit($id_faixa_etaria){  
        $dados["faixa_etaria"] =  Service::get("faixa_etaria", "id_faixa_etaria", $id_faixa_etaria);      
        $dados["view"]   = "FaixaEtaria/Index";
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
         if($obj->id_faixa_etaria){
            $this->redirect(URL_BASE . "FaixaEtaria/edit/" . $obj->id_faixa_etaria);
         }else{
            $this->redirect(URL_BASE . "FaixaEtaria/Index");
         }        
       }          
    } 

    public function buscarFaixaEtaria($id_faixa_etaria){
        $retorno = new stdClass;
        try {
            $faixa_etaria = Service::get("faixa_etaria","id_faixa_etaria", $id_faixa_etaria);
            $retorno->tem_erro = false;
            $retorno->dados = $faixa_etaria;
        } catch (\Throwable $th) {
            $retorno->tem_erro = true;
            $retorno->msg = $th->getMessage();
        }

        echo json_encode($retorno);
    }
    
    public function excluir($id_faixa_etaria) {
        Service::excluir("faixa_etaria", "id_faixa_etaria", $id_faixa_etaria);
        $this->redirect(URL_BASE . "FaixaEtaria");
    }    
 }
?>