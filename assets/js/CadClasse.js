function buscarClasse(id_classe) {
    $.ajax({
        url: base_url + "classe/buscarClasse/" + id_classe,
        type: "get",
        dataType: "json",
        success: function (data) {
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
    $('#id_classe').val(data.id_classe);
    $('#classe').val(data.classe);
    $('#id_faixa_etaria').val(data.id_faixa_etaria);
    $('#descricao').val(data.descricao);
    $('#modalTitle').text('Editar Classe');
}

function abrirModal() {
    // Limpar os campos do formulário
    $('#id_classe').val('');
    $('#classe').val('');
    $('#id_faixa_etaria').val('');
    $('#descricao').val('');
    // Ajustar o título do modal
    $('#modalTitle').text('Cadastrar Classe');
    // Abrir o modal
    $('#cad').modal('show');
}
