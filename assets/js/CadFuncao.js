function buscarFuncao(id_funcao) {
    $.ajax({
        url: base_url + "funcao/buscarFuncao/" + id_funcao,
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
    $('#id_funcao').val(data.id_funcao);
    $('#funcao').val(data.funcao);
    $('#modalTitle').text('Editar Função');
}

function abrirModalCadastro() {
    // Limpar os campos do formulário
    $('#id_funcao').val('');
    $('#funcao').val('');
    // Ajustar o título do modal
    $('#modalTitle').text('Cadastrar Função');
    // Abrir o modal
    $('#cad').modal('show');
}
