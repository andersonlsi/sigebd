function criarSessao() {    
    var sessao = $("#sessao").val();
    var secret = $("#secret").val();
    $.ajax({

        url:base_url + "wpp/criarSessao",
        type:"POST",
        dataType:"JSON",
        data:{
            sessao:sessao,
            secret :secret,
        },
        success:function(data){
            fecharModal();
            if(data.tem_erro==true){
                $("#mostrarUmErro").html(MostrarUmaMsgErro("Erro: " +  data.erro));
            }else{
                $("#mostrarSucesso").html(MostrarUmaMsgSucesso("inserido com sucesso"));
                $("#token").val(data.token);
                $("#imageQRCode").attr('src',  data.retorno.qrcode);
            }
        },
        error:function(data){

        }

    });
}

function enviarMensagem() {    
    var txt = $("#txt").val();
    var min = $("#min").val();
    var max = $("#max").val();
    var leads = $("#leads").val();
    var sessao = $("#sessao").val();
    var token = $("#token").val();
    $.ajax({

        url:base_url + "wppDisparo/enviarMensagem",
        type:"POST",
        dataType:"JSON",
        data:{
            txt:txt,
            min:min,
            max:max,
            leads:leads,
            sessao:sessao,
            token :token,
        },
        success:function(data){
            fecharModal();
            if(data.tem_erro==true){
                $("#mostrarUmErro").html(MostrarUmaMsgErro("Erro: " +  data.erro));
            }else{
                $("#mostrarSucesso").html(MostrarUmaMsgSucesso("inserido com sucesso"));
               console.log(data);
            }
        },
        error:function(data){

        }

    });
}



