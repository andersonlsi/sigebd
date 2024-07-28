function buscarCategoria(id_categoria) {
    $.ajax({
        url: base_url + "categoria/buscarCategoria/" + id_categoria,
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
    $('#id_categoria').val(data.id_categoria);
    $('#categoria').val(data.categoria);
    $('#modalTitle').text('Editar Categoria');
}

function abrirModal() {
    // Limpar os campos do formulário
    $('#id_categoria').val('');
    $('#categoria').val('');
    // Ajustar o título do modal
    $('#modalTitle').text('Cadastrar Categoria');
    // Abrir o modal
    $('#cad').modal('show');
}
