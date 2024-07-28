<?php
namespace app\controllers;
use app\core\Controller;
use app\core\Flash;
use app\models\service\AulaService;
use app\models\service\Service;
use app\util\UtilService;
use stdClass;

class AulaController extends Controller{ 
    
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
        $listaAulas = AulaService::lista("aula");
        foreach ($listaAulas as $aula) {
            $presencaFalta = AulaService::getPresencaFalta($aula->id_aula);
            $aula->total_presenca = $presencaFalta->total_presenca;
            $aula->total_falta = $presencaFalta->total_falta;
            $aula->total_matriculado = $presencaFalta->total_matriculado;
        }
    
        $dados["lista"] = $listaAulas;
        $dados["view"]  = "Aula/Index";
        $this->load("template", $dados);
    }
    
    
    public function salvar(){            
        $obj            = new stdClass;
        $obj->id_Aula   = $_POST["id_aula"];         
        $obj->dta_aula  = $_POST["dta_aula"];  
        $obj->numero    = $_POST["numero"];  
   
       Flash::setForm($obj);        
      
      // Verifica se já existe aula com a mesma data
      if (AulaService::existeDataAula($obj->dta_aula)) {
        Flash::setErro(["Já existe uma aula cadastrada com esta data"]);        
        $this->redirect(URL_BASE . "aula");
        return;
       }

        AulaService::salvar($obj, "id_aula", "aula");
        $this->redirect(URL_BASE . "aula");             
    } 

    public function buscarAula($id_aula){
        $retorno = new stdClass;
        try {
            $aula = Service::get("aula","id_aula", $id_aula);
            $retorno->tem_erro = false;
            $retorno->dados = $aula;
        } catch (\Throwable $th) {
            $retorno->tem_erro = true;
            $retorno->msg = $th->getMessage();
        }

        echo json_encode($retorno);
    }
    
    public function excluir($id_Aula) {
        Service::excluir("Aula", "id_Aula", $id_Aula);
        $this->redirect(URL_BASE . "Aula");
    }    
 }
?>