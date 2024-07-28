function buscarUsuario(id_usuario) {
    $.ajax({
        url: base_url + "Usuario/buscarUsuario/" + id_usuario,
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
    $('#id_usuario').val(data.id_usuario);
    $('#usuario').val(data.usuario);
    $('#email').val(data.email);
    $('#senha').val(data.senha);
    $('#modalTitle').text('Editar Usuário');
}

function abrirModal() {
    // Limpar os campos do formulário
    $('#id_usuario').val('');
    $('#usuario').val('');
    $('#email').val('');
    $('#senha').val('');
    // Ajustar o título do modal
    $('#modalTitle').text('Cadastrar Usuário');
    // Abrir o modal
    $('#cad').modal('show');
}
