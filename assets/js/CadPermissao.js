function buscarPermissao(id_permissao) {
    $.ajax({
        url: base_url + "Permissao/buscarPermissao/" + id_permissao,
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
    $('#id_permissao').val(data.id_permissao);
    $('#permissao').val(data.permissao);
    $('#descricao').val(data.descricao);
    $('#modalTitle').text('Editar Permissao');
}

function abrirModal() {
    // Limpar os campos do formulário
    $('#id_permissao').val('');
    $('#permissao').val('');
    $('#descricao').val('');
    // Ajustar o título do modal
    $('#modalTitle').text('Cadastrar Permissao');
    // Abrir o modal
    $('#cad').modal('show');
}
