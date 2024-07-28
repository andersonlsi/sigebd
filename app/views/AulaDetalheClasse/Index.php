<div>
    <a href="<?php echo URL_BASE . 'aulaDetalhe/index/' . $detalhe->id_aula; ?>"><i class="ti-arrow-left"
            style="font-size: 30px;"></i></a>
</div>
<h2 align='center'>
    Chamada dos alunos da classe <strong><?php echo $detalhe->classe; ?></strong>
</h2>
<h6 align='center'>Clique no Checkbox de cada aluno para confirmar a presença.</h6>
<div><br></div>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <table id="datatable" class="table table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>Nome Aluno</th>
                            <th>Presente?</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($lista as $c) { ?>
                        <tr>
                            <td><?php echo $c->nome_aluno ?></td>
                            <td>
                                <div class="form-check form-switch form-switch-lg mb-3" dir="ltr">
                                    <input type="checkbox" class="form-check-input"
                                        id="customSwitchsizelg_<?php echo $c->id_aluno; ?>"
                                        <?php echo $c->presente == 'P' ? 'checked' : ''; ?>
                                        onclick="atualizarPresenca(<?php echo $detalhe->id_aula; ?>, <?php echo $detalhe->id_classe; ?>, <?php echo $c->id_aluno; ?>, this.checked)">
                                    <label class="form-check-label"
                                        for="customSwitchsizelg_<?php echo $c->id_aluno; ?>"></label>
                                </div>
                            </td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div>
<div><br><br></div>
<div>
    <?php $this->verMsg(); $this->verErro();?>
</div>
<div class="row">
    <div class="col-12">
        <h2 align='center'>
            <a href="#" data-bs-toggle="modal" data-bs-target="#editModal">
                <i class="fas fa-poll-h"></i>
                Detalhes da Classe
            </a>
        </h2>
        <h6 align='center'>Resumo da Classe por aula, onde poderá ser alterado alguns campos no botão Editar Detalhe.
        </h6>
        <div><br></div>
        <table class="table table-bordered">
            <tr>
                <th>
                    <i class="fas fa-calendar-alt"></i>
                    Data da Aula
                </th>
                <td><?php echo databr($detalhe->dta_aula); ?></td>
            </tr>
            <tr>
                <th>
                    <i class="fas fa-users"></i>
                    Total de Matriculados
                </th>
                <td><?php echo $detalhe->qtde_matriculado; ?></td>
            </tr>
            <tr>
                <th>
                    <i class="fas fa-users"></i>
                    Total de Presentes
                </th>
                <td><?php echo $detalhe->qtde_presenca; ?></td>
            </tr>
            <tr>
                <th>
                    <i class="fas fa-users"></i>
                    Total de Faltas
                </th>
                <td><?php echo $detalhe->qtde_falta; ?></td>
            </tr>
            <tr>
                <th>
                    <i class="fas fa-users"></i>
                    Total de Visitantes
                </th>
                <td><?php echo $detalhe->qtde_visitante; ?></td>
            </tr>
            <tr>
                <th>
                    <i class="fas fa-book"></i>
                    Total de Bíblia
                </th>
                <td><?php echo $detalhe->qtde_biblia; ?></td>
            </tr>
            <tr>
                <th>
                    <i class="fas fa-book-open"></i>
                    Total de Revista
                </th>
                <td><?php echo $detalhe->qtde_revista; ?></td>
            </tr>

            <tr>
                <th>
                    <i class="fas fa-money-bill"></i>
                    Ofertas
                </th>
                <td>R$ <?php echo $detalhe->valor_oferta; ?></td>
            </tr>
            <tr>
                <th>
                    <i class="fas fa-poll-h"></i>
                    Observação
                </th>
                <td><?php echo $detalhe->observacao; ?></td>
            </tr>
        </table>
    </div>
</div>
<div><br><br></div>

<!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="formEdit" action="<?php echo URL_BASE . "aulaDetalheClasse/salvar" ?>" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Editar Detalhes da Classe</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <input type="hidden" name="id_aula_detalhe"
                                value="<?php echo $detalhe->id_aula_detalhe ?>" />
                            <div class="form-group">
                                <label for="qtde_biblia">Total de Bíblia:</label>
                                <input type="text" class="form-control" name="qtde_biblia"
                                    value="<?php echo $detalhe->qtde_biblia ?>" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="qtde_revista">Total de Revista:</label>
                                <input type="text" class="form-control" name="qtde_revista"
                                    value="<?php echo $detalhe->qtde_revista ?>" />
                            </div>
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="qtde_visitante">Total de Visitante:</label>
                                <input type="text" class="form-control" name="qtde_visitante"
                                    value="<?php echo $detalhe->qtde_visitante ?>" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="valor_oferta">Ofertas:</label>
                                <input type="text" class="form-control" name="valor_oferta"
                                    value="<?php echo $detalhe->valor_oferta ?>" />
                            </div>
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <div class="col-sm">
                            <div class="form-group">
                                <label for="observacao">Observação:</label>
                                <textarea class="form-control"
                                    name="observacao"><?php echo $detalhe->observacao ?></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
function atualizarPresenca(id_aula, id_classe, id_aluno, presente) {
    var valor_presenca = presente ? 'P' : 'F';
    $.ajax({
        url: '<?php echo URL_BASE; ?>aulaDetalheClasse/atualizarPresenca',
        type: 'POST',
        data: {
            id_aula: id_aula,
            id_classe: id_classe,
            id_aluno: id_aluno,
            presente: valor_presenca
        },
        success: function(response) {
            location.reload(); // Recarrega a página após o sucesso da atualização
        },
        error: function(error) {
            console.log(error);
        }
    });
}
</script>