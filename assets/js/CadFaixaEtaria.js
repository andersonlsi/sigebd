function buscarFaixaEtaria(id_faixa_etaria) {
    $.ajax({
        url: base_url + "FaixaEtaria/buscarFaixaEtaria/" + id_faixa_etaria,
        type: "get",
        dataType: "json",
        success: function (data) {
            console.log(data);
            if (data.tem_erro) {
                alert(data.msg);
            } else {
                mostrarDados(data.dados);
                // Abrir o modal
                $('#cad').modal('show');
            }
        },
        beforeSend: function () {
            // Opcional: código a ser executado antes do envio da requisição
        }
    });
}

function mostrarDados(data) {
    $('#id_faixa_etaria').val(data.id_faixa_etaria);
    $('#faixa_etaria').val(data.faixa_etaria);
    $('#modalTitle').text('Editar Faixa Etária');
}

function abrirModal() {
    // Limpar os campos do formulário
    $('#id_faixa_etaria').val('');
    $('#faixa_etaria').val('');
    // Ajustar o título do modal
    $('#modalTitle').text('Cadastrar Faixa Etária');
    // Abrir o modal
    $('#cad').modal('show');
}
