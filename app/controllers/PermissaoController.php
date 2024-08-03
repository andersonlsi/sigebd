<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\PermissaoService;
use app\models\service\Service;
use app\util\UtilService;
use stdClass;

class PermissaoController extends Controller{
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
        $dados["lista"] = Service::lista("permissao");                   
        $dados["view"]  = "Permissao/Index";
        $this->load("template", $dados);
    } 

    public function create(){   
        $dados["permissao"]    = Flash::getForm();         
        $dados["view"]         = "Permissao/Index";
        $this->load("template", $dados);
    } 

    public function edit($id_permissao){  
        $dados["permissao"] =  Service::get("permissao", "id_permissao", $id_permissao);      
        $dados["view"]   = "Permissao/Index";
        $this->load("template", $dados);
    } 

    public function salvar(){            
        $obj = new stdClass;
        $obj->id_permissao = $_POST["id_permissao"] ? $_POST["id_permissao"] : null;
        $obj->permissao    = $_POST["permissao"]; 
        $obj->descricao = $_POST["descricao"];       

       //i($obj);

       Flash::setForm($obj); 
       $resultado = PermissaoService::salvar($obj, "id_permissao", "permissao");

       if($resultado){
         $this->redirect(URL_BASE . "Permissao");
       }else{
         if($obj->id_faixa_etaria){
            $this->redirect(URL_BASE . "Permissao/edit/" . $obj->id_permissao);
         }else{
            $this->redirect(URL_BASE . "Permissao/Index");
         }        
       }          
    } 

    public function buscarPermissao($id_permissao){
        $retorno = new stdClass;
        try {
            $faixa_etaria = Service::get("permissao","id_permissao", $id_permissao);
            $retorno->tem_erro = false;
            $retorno->dados = $faixa_etaria;
        } catch (\Throwable $th) {
            $retorno->tem_erro = true;
            $retorno->msg = $th->getMessage();
        }

        echo json_encode($retorno);
    }
    
    public function excluir($id_permissao) {
        Service::excluir("permissao", "id_permissao", $id_permissao);
        $this->redirect(URL_BASE . "Permissao");
    }    
 }
?>