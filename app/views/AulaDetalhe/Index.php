<?php $this->verMsg(); $this->verErro();?>
<div>
    <a href="<?php echo URL_BASE . 'Aula/Index'; ?>"><i class="ti-arrow-left" style="font-size: 30px;"></i></a>
</div>
<h2 align='center'>Classes</h2>
<h6 align='center'>Abaixo mostra Resumo por <strong>Classe</strong>, onde clicando em um poderá acessar indivisualmente
    e visualizar o
    relatório e realizar a chamada e os detalhes por <strong>Classe</strong>.</h6>
<div><br></div>
<div class="row">
    <?php foreach ($detalhes as $detalhe) { ?>
    <div class="col-xl-3 col-sm-6 mb-2">
        <!-- Adicionando margem inferior -->
        <div class="card mini-stat bg-primary">
            <div class="card-body mini-stat-img p-2">
                <!-- Ajustando o padding -->
                <div class="text-white">
                    <h6 class="text-uppercase mb-3 font-size-16 text-white"><?php echo $detalhe->classe; ?></h6>
                    <h2 class="mb-4 text-white">Total Matriculados: <?php echo $detalhe->qtde_matriculado; ?></h2>
                    <span class="badge bg-info">Total Presença: <?php echo $detalhe->qtde_presenca; ?></span>
                    <span class="badge bg-danger">Total Falta: <?php echo $detalhe->qtde_falta; ?></span>
                    <span class="badge bg-success">Oferta: R$ <?php echo $detalhe->valor_oferta; ?></span>
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
            Total de Ofertas
        </th>
        <td>R$: <?php echo $geral->total_oferta; ?></td>
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
</script>