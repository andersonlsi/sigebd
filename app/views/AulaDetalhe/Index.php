<link href="<?php echo URL_BASE?>assets/css/aulaDetalhe.css" rel="stylesheet" type="text/css" />
<?php $this->verMsg(); $this->verErro();?>
<div>
    <a href="<?php echo URL_BASE . 'Aula/Index'; ?>"><i class="ti-arrow-left" style="font-size: 30px;"></i></a>
</div>
<h2 align='center'>Classes</h2>
<h6 align='center'>Abaixo mostra Resumo por <strong>Classe</strong>, onde clicando em um poderá acessar indivisualmente
    e visualizar o
    relatório e realizar a chamada e os detalhes por <strong>Classe</strong>.</h6>
<header class="spacer"></header>
<div class="card-container">
    <div class="row">
        <?php foreach ($detalhes as $detalhe) { ?>
        <div class="col-xl-3 col-sm-6 mb-2 list-item">
            <div class="card mini-stat" style="background-color: #2B3A4A;">
                <div class="card-body mini-stat-img p-2">
                    <div class="text-white">
                        <h6 class="text-uppercase mb-3 font-size-16 text-white"><?php echo $detalhe->classe; ?></h6>
                        <h2 class="mb-4 text-white">Total Matriculados: <?php echo $detalhe->qtde_matriculado; ?></h2>
                        <div class="badge-container">
                            <span class="badge bg-info">Total Presença: <?php echo $detalhe->qtde_presenca; ?></span>
                            <span class="badge bg-danger">Total Falta: <?php echo $detalhe->qtde_falta; ?></span>
                            <span class="badge bg-success">Oferta: R$ <?php echo $detalhe->valor_oferta; ?></span>
                        </div>
                    </div>
                    <div class="text-center mt-3">
                        <a href="<?php echo URL_BASE . "aulaDetalheClasse/index/" . $detalhe->id_aula_detalhe ?>"
                            class="btn btn-light">Ver Detalhes</a>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>
</div>
<header class="spacer"></header>
<h2 align='center'>Relatório Geral da Aula</h2>
<h5 align='center'>Lição:<strong> <?php echo $detalhe->numero; ?></strong> | Data:
    <strong><?php echo databr($detalhe->dta_aula); ?></strong>
</h5>

<table class="table table-bordered">
    <tr>
        <th>
            <i class="fas fa-users"></i>
            Total Matriculados
        </th>
        <td><?php echo $geral->total_matriculado; ?></td>
    </tr>
    <tr>
        <th>
            <i class="fas fa-users"></i>
            Total Presenças
        </th>
        <td><?php echo $geral->total_presenca; ?></td>
    </tr>
    <tr>
        <th>
            <i class="fas fa-users"></i>
            Total Faltas
        </th>
        <td><?php echo $geral->total_falta; ?></td>
    </tr>
    <tr>
        <th>
            <i class="fas fa-users"></i>
            Total Visitantes
        </th>
        <td><?php echo $geral->total_visitante; ?></td>
    </tr>
    <tr>
        <th>
            <i class="fas fa-book"></i>
            Total Bíblias
        </th>
        <td><?php echo $geral->total_biblia; ?></td>
    </tr>
    <tr>
        <th>
            <i class="fas fa-book-open"></i>
            Total Revistas
        </th>
        <td><?php echo $geral->total_revista; ?></td>
    </tr>
    <tr>
        <th>
            <i class="fas fa-money-bill"></i>
            Total de Entradas(Ofertas)
        </th>
        <td><span class="totaloferta"><strong>R$: <?php echo $geral->total_oferta; ?></strong></span></td>
    </tr>
    <tr>
        <th>
            <a href="#" data-bs-toggle="modal" data-bs-target="#modalSaida">
                <i class="fas fa-poll-h"></i>
                Total de saída
            </a>
        </th>
        <td><span class="totalsaida"><strong>R$: <?php echo $geral->total_saida; ?></strong></span></td>
    </tr>
    <tr>
        <th>
            <i class="fas fa-money-bill"></i>
            Total Final
        </th>
        <td><span class="totalfinal"><strong>R$: <?php echo $geral->total_final; ?></strong></span></td>
    </tr>
    <tr>
        <th>
            <a href="#" data-bs-toggle="modal" data-bs-target="#editObservacaoModal">
                <i class="fas fa-poll-h"></i>
                Observação
            </a>
        </th>
        <td><?php echo $geral->observacao; ?></td>
    </tr>

</table>

<!-- Modal para editar a observação -->
<div class="modal fade" id="editObservacaoModal" tabindex="-1" aria-labelledby="editObservacaoModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editObservacaoModalLabel">Registro de Observação da Aula</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="id_aula" value="<?php echo $geral->id_aula; ?>" />
                <div class="form-group">
                    <label for="observacao">Observação:</label>
                    <textarea class="form-control" id="observacao"><?php echo $geral->observacao; ?></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="salvarObservacao">Salvar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal para editar a saída -->
<div class="modal fade" id="modalSaida" tabindex="-1" aria-labelledby="modalSaidaLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalSaidaLabel">Registrar Saída</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="id_aula_saida" value="<?php echo $geral->id_aula; ?>" />
                <div class="form-group">
                    <label for="categoria">Categoria:</label>
                    <select class="form-control" id="id_categoria">
                        <?php foreach ($categorias as $categoria) { ?>
                            <option value="<?php echo $categoria->id_categoria; ?>"><?php echo $categoria->categoria; ?></option>
                        <?php } ?>
                    </select>
                </div>
                <div class="form-group">
                    <label for="valor_saida">Valor de Saída:</label>
                    <input type="number" class="form-control" id="valor_saida" step="0.01">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="salvarSaida">Salvar</button>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('salvarObservacao').addEventListener('click', function() {
    var observacao = document.getElementById('observacao').value;
    var id_aula = document.getElementById('id_aula').value;

    $.ajax({
        url: '<?php echo URL_BASE; ?>aulaDetalhe/salvarObservacao',
        type: 'POST',
        data: {
            id_aula: id_aula,
            observacao: observacao
        },
        success: function(response) {
            var result = JSON.parse(response);
            if (result.success) {
                // Atualiza o campo observação na página principal
                $('#editObservacaoModal').modal('hide');
                location.reload(); // Recarrega a página para refletir a mudança
            } else {
                alert('Erro ao salvar o registro');
            }
        },
        error: function(error) {
            console.log(error);
        }
    });
});

// salvar saida
document.getElementById('salvarSaida').addEventListener('click', function() {
    var id_categoria = document.getElementById('id_categoria').value;
    var id_aula = document.getElementById('id_aula').value;
    var valor_saida = document.getElementById('valor_saida').value;

    $.ajax({
        url: '<?php echo URL_BASE; ?>aulaDetalhe/salvarSaida',
        type: 'POST',
        data: {
            id_aula: id_aula,
            id_categoria: id_categoria,
            valor_saida: valor_saida
        },
        success: function(response) {
            var result = JSON.parse(response);
            if (result.success) {                
                $('#modalSaida').modal('hide');
                location.reload(); // Recarrega a página para refletir a mudança
            } else {
                alert('Erro ao salvar o registro');
            }
        },
        error: function(error) {
            console.log(error);
        }
    });
});

document.addEventListener('DOMContentLoaded', function() {
    // Obtém a referência para o contêiner de cartões
    var cardContainer = document.querySelector('.card-container');

    // Define a altura máxima do contêiner com base na altura da janela ou outro critério
    var maxHeight = window.innerHeight * 0.6; // Por exemplo, 60% da altura da janela
    cardContainer.style.maxHeight = maxHeight + 'px';

    // Opcional: Ajusta o tamanho quando a janela é redimensionada
    window.addEventListener('resize', function() {
        var newMaxHeight = window.innerHeight * 0.6;
        cardContainer.style.maxHeight = newMaxHeight + 'px';
    });
});
</script>