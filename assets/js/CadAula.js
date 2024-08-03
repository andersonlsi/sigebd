function buscarAula(id_aula) {
    $.ajax({
        url: base_url + "aula/buscarAula/" + id_aula,
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
    $('#id_aula').val(data.id_aula);
    $('#dta_aula').val(data.dta_aula);
    $('#numero').val(data.numero);
    $('#modalTitle').text('Editar Aula');
}

function abrirModal() {
    // Limpar os campos do formulário
    $('#id_aula').val('');
    $('#dta_aula').val('');
    $('#numero').val('');

    // Obter a data atual
    const today = new Date();
    const day = String(today.getDate()).padStart(2, '0');
    const month = String(today.getMonth() + 1).padStart(2, '0'); // Janeiro é 0!
    const year = today.getFullYear();
    const todayString = `${year}-${month}-${day}`;

    // Definir a data atual no campo de data
    $('#dta_aula').val(todayString);

    // Ajustar o título do modal
    $('#modalTitle').text('Cadastrar Aula');
    // Abrir o modal
    $('#cad').modal('show');
}

document.addEventListener("DOMContentLoaded", function() {
    var listItems = document.querySelectorAll(".list-item");
    if (listItems.length >= 3) {
        document.getElementById("scrollable-list").classList.add("apply-scroll");
    }
});
