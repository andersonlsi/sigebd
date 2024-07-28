function buscarPerfil(id_perfil) {
    $.ajax({
        url: base_url + "Perfil/buscarPerfil/" + id_perfil,
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
    $('#id_perfil').val(data.id_perfil);
    $('#perfil').val(data.perfil);
    $('#descricao').val(data.descricao);
    $('#modalTitle').text('Editar Perfil');
}

function abrirModal() {
    // Limpar os campos do formulário
    $('#id_perfil').val('');
    $('#perfil').val('');
    $('#descricao').val('');
    // Ajustar o título do modal
    $('#modalTitle').text('Cadastrar Perfil');
    // Abrir o modal
    $('#cad').modal('show');
}
