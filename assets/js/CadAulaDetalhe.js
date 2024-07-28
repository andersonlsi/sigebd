$(document).ready(function () {
    $("#form").submit(function (event) {
        event.preventDefault();

        $.ajax({
            url: $(this).attr('action'),
            type: 'post',
            data: $(this).serialize(),
            success: function (response) {
                alert("Dados salvos com sucesso!");
            },
            error: function (xhr, status, error) {
                alert("Ocorreu um erro ao salvar os dados.");
            }
        });
    });
});
