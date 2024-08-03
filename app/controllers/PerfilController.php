<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\PerfilService;
use app\models\service\Service;
use app\util\UtilService;
use stdClass;

class PerfilController extends Controller{  

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
        $dados["lista"] = Service::lista("perfil");                   
        $dados["view"]  = "Perfil/Index";
        $this->load("template", $dados);
    } 

    public function create(){   
        $dados["perfil"] = Flash::getForm();         
        $dados["view"]         = "Perfil/Index";
        $this->load("template", $dados);
    } 

    public function edit($id_perfil){  
        $dados["perfil"] =  Service::get("perfil", "id_perfil", $id_perfil);      
        $dados["view"]   = "Perfil/Index";
        $this->load("template", $dados);
    } 

    public function salvar(){            
        $obj = new stdClass;
        $obj->id_perfil = $_POST["id_perfil"] ? $_POST["id_perfil"] : null;
        $obj->perfil    = $_POST["perfil"]; 
        $obj->descricao = $_POST["descricao"];       

       //i($obj);

       Flash::setForm($obj); 
       $resultado = PerfilService::salvar($obj, "id_perfil", "perfil");

       if($resultado){
         $this->redirect(URL_BASE . "Perfil");
       }else{
         if($obj->id_faixa_etaria){
            $this->redirect(URL_BASE . "Perfil/edit/" . $obj->id_perfil);
         }else{
            $this->redirect(URL_BASE . "Perfil/Index");
         }        
       }          
    } 

    public function buscarPerfil($id_perfil){
        $retorno = new stdClass;
        try {
            $faixa_etaria = Service::get("perfil","id_perfil", $id_perfil);
            $retorno->tem_erro = false;
            $retorno->dados = $faixa_etaria;
        } catch (\Throwable $th) {
            $retorno->tem_erro = true;
            $retorno->msg = $th->getMessage();
        }

        echo json_encode($retorno);
    }
    
    public function excluir($id_perfil) {
        Service::excluir("perfil", "id_perfil", $id_perfil);
        $this->redirect(URL_BASE . "Perfil");
    }    
 }
?>