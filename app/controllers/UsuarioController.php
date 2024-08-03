<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\UsuarioService;
use app\models\service\Service;
use app\util\UtilService;
use stdClass;

class UsuarioController extends Controller{ 
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
        $dados["lista"] = Service::lista("usuario");                   
        $dados["view"]  = "Usuario/Index";
        $this->load("template", $dados);
    } 

    public function create(){   
        $dados["usuario"] = Flash::getForm();         
        $dados["view"]         = "Usuario/Index";
        $this->load("template", $dados);
    } 

    public function edit($id_usuario){  
        $dados["usuario"] =  Service::get("usuario", "id_usuario", $id_usuario);      
        $dados["view"]   = "Usuario/Index";
        $this->load("template", $dados);
    } 

    public function salvar(){            
        $obj = new stdClass;
        $obj->id_usuario      = $_POST["id_usuario"] ? $_POST["id_usuario"] : null;
        $obj->usuario         = $_POST["usuario"];  
        $obj->email           = $_POST["email"]; 
        $obj->senha           = password_hash($_POST["senha"], PASSWORD_DEFAULT); // Criptografa a senha
        $obj->dta_cadastro    = hoje();   
        $obj->status          = "A";
    
       Flash::setForm($obj); 
       $resultado = UsuarioService::salvar($obj, "id_usuario", "usuario");
    
       if($resultado){
         $this->redirect(URL_BASE . "Usuario");
       }else{
         if($obj->id_usuario){
            $this->redirect(URL_BASE . "Usuario/edit/" . $obj->id_usuario);
         }else{
            $this->redirect(URL_BASE . "Usuario/Index");
         }        
       }          
    } 
    

    public function buscarUsuario($id_usuario){
        $retorno = new stdClass;
        try {
            $usuario = Service::get("usuario","id_usuario", $id_usuario);
            $retorno->tem_erro = false;
            $retorno->dados = $usuario;
        } catch (\Throwable $th) {
            $retorno->tem_erro = true;
            $retorno->msg = $th->getMessage();
        }

        echo json_encode($retorno);
    }
    
    public function excluir($id_usuario) {
        Service::excluir("usuario", "id_usuario", $id_usuario);
        $this->redirect(URL_BASE . "Usuario");
    }    
 }
?>