<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\AlunoService;
use app\models\service\Service;
use app\util\UtilService;
use stdClass;

class AlunoController extends Controller{
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
        $dados["lista"] = AlunoService::lista();           
      //  i($dados["lista"]);            
        $dados["view"]  = "Aluno/Index";
        $this->load("template", $dados);
    } 

    public function create(){ 
        $dados["aluno"]   = Flash::getForm(); 
        $dados["classe"]  = AlunoService::classe("classe");  
        $dados["funcao"]  = AlunoService::funcao("funcao");    
          
        $dados["view"]    = "Aluno/Create";
        $this->load("template", $dados);
    } 

    public function edit($id_aluno){  
        $dados["aluno"]   =  Service::get("aluno", "id_aluno", $id_aluno); 
        $dados["classe"]  = AlunoService::classe("classe");  
        $dados["funcao"]  = AlunoService::funcao("funcao");   
         
        $dados["view"]    = "Aluno/Create";
        $this->load("template", $dados);
    } 

    public function salvar(){            
        $obj               = new stdClass;
        $obj->id_aluno     = $_POST["id_aluno"] ? $_POST["id_aluno"] : null;
        $obj->id_classe    = $_POST["id_classe"]; 
        $obj->id_funcao    = $_POST["id_funcao"];       
        $obj->nome         = $_POST["nome"];         
        $obj->data_nasc    = $_POST["data_nasc"]; 
        $obj->email        = $_POST["email"];
        $obj->cel          = $_POST["cel"];   
        $obj->sexo         = $_POST["sexo"]; 
        $obj->estado_civil = $_POST["estado_civil"]; 
        $obj->endereco     = $_POST["endereco"]; 
        $obj->estado       = $_POST["estado"]; 
        $obj->cidade       = $_POST["cidade"]; 
        $obj->bairro       = $_POST["bairro"]; 
        $obj->cep          = $_POST["cep"]; 
        $obj->responsavel  = $_POST["responsavel"]; 
        $obj->cel_resp     = $_POST["cel_resp"]; 
        $obj->observacao   = $_POST["observacao"]; 
        $obj->status       = "A";        
        
      // i($obj);

       Flash::setForm($obj); 
       $resultado = AlunoService::salvar($obj, "id_aluno", "aluno");

       if($resultado){
         $this->redirect(URL_BASE . "aluno");
       }else{
         if($obj->id_aluno){
            $this->redirect(URL_BASE . "aluno/edit/" . $obj->id_aluno);
         }else{
            $this->redirect(URL_BASE . "aluno/create");
         }        
       }          
    } 
    
    public function excluir($id_aluno) {
        Service::excluir("aluno", "id_aluno", $id_aluno);
        $this->redirect(URL_BASE . "aluno");
    }
    
 }
?>