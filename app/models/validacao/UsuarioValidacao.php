<?php
namespace app\models\validacao;

use app\core\Validacao;
use app\models\service\Service;

class UsuarioValidacao{
    public static function salvar($usuario){
        $validacao = new Validacao();
        
        //setando os dados
        $validacao->setData("usuario",$usuario->usuario); 
        $validacao->setData("email",$usuario->email);   
        $validacao->setData("senha",$usuario->senha); 

        //validar os dados
        $validacao->getData("usuario")->isVazio()->isMinimo(5);
        $validacao->getData("email")->isVazio()->isEmail();
        $validacao->getData("senhas")->isVazio();
        
        if($usuario->email){
            $tem = Service::get("usuario", "email", $usuario->email);
            if($tem && $tem->id_usuario != $usuario->id_usuario){
                $validacao->getData("email")->isUnico(1);
            }            
        }
       
        return $validacao;
    }
}