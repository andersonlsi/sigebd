<style>
/* Estilo para o contêiner da lista com rolagem */
.list-container {
    max-height: 400px;
    /* Altura máxima da área com rolagem */
    overflow-y: auto;
    /* Permite rolagem vertical */
    border: 1px solid #ddd;
    /* Borda opcional */
    border-radius: 5px;
    /* Bordas arredondadas opcionais */
    padding: 10px;
    /* Preenchimento opcional */
    background-color: #f9f9f9;
    /* Cor de fundo opcional */
}

/* Estilo para a lista */
.list-group {
    list-style-type: none;
    /* Remove marcadores padrão */
    padding: 0;
    /* Remove preenchimento padrão */
    margin: 0;
    /* Remove margens padrão */
}

/* Estilo para cada item da lista */
.list-group-item {
    display: flex;
    /* Usa flexbox para alinhar o conteúdo */
    justify-content: space-between;
    /* Espaça o conteúdo dos itens */
    padding: 10px;
    /* Preenchimento dos itens */
    border-bottom: 1px solid #ddd;
    /* Borda inferior para separar os itens */
    background-color: #fff;
    /* Cor de fundo para os itens */
}

/* Estilo para o switch */
.form-check-input {
    margin-left: auto;
    /* Alinha o switch à direita */
}
</style>
<div>
    <?php $this->verMsg(); $this->verErro();?>
</div>
<div>
    <a href="<?php echo URL_BASE . 'aulaDetalhe/index/' . $detalhe->id_aula; ?>"><i class="ti-arrow-left"
            style="font-size: 30px;"></i></a>
</div>
<header class="spacer"></header>
<h2 align='center'>Chamada dos alunos da classe <strong><?php echo $detalhe->classe; ?></strong></h2>
<h6 align='center'>Clique no Checkbox de cada aluno para confirmar a presença.</h6>
<header class="spacer"></header>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="list-container">
                    <ul class="list-group">
                        <?php foreach ($lista as $c) { ?>
                        <li class="list-group-item">
                            <span><strong><?php echo $c->nome_aluno; ?></strong></span>
                            <div class="form-check form-switch form-switch-lg mb-3" dir="ltr">
                                <input type="checkbox" class="form-check-input"
                                    id="customSwitchsizelg_<?php echo $c->id_aluno; ?>"
                                    <?php echo $c->presente == 'P' ? 'checked' : ''; ?>
                                    onchange="marcarPresenca(<?php echo $c->id_aluno; ?>, this.checked)">
                                <label class="form-check-label"
                                    for="customSwitchsizelg_<?php echo $c->id_aluno; ?>"></label>
                            </div>
                        </li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div align='right'>
    <button class="btn btn-primary w-md waves-effect waves-light" onclick="salvarAlteracoes()">Salvar Presença</button>
</div>
<header class="spacer"></header>
<div class="row">
    <div class="col-12">
        <h2 align='center'>
            <a href="#" data-bs-toggle="modal" data-bs-target="#editModal">
                <i class="fas fa-poll-h"></i> Detalhes da Classe
            </a>
        </h2>
        <h6 align='center'>Resumo da Classe por aula, onde poderá ser alterado alguns campos no título <strong>Detalhes
                da Classe acima.</strong>
        </h6>
        <header class="spacer"></header>
        <div class="table-responsive">
            <table class="table table-editable table-nowrap align-middle table-edits">
                <thead>
                    <th class="text-center"><i class="fas fa-calendar-alt"></i> Data da Aula</th>
                    <th class="text-center"><i class="fas fa-users"></i> Total de Matriculados</th>
                    <th class="text-center"><i class="fas fa-users"></i> Total de Presentes</th>
                    <th class="text-center"><i class="fas fa-users"></i> Total de Faltas</th>
                    <th class="text-center"><i class="fas fa-users"></i> Total de Visitantes</th>
                    <th class="text-center"><i class="fas fa-book"></i> Total de Bíblia</th>
                    <th class="text-center"><i class="fas fa-book-open"></i> Total de Revista</th>
                    <th class="text-center"><i class="fas fa-money-bill"></i> Ofertas</th>
                </thead>
                <tbody>
                    <tr data-id="<?php echo $detalhe->id_aula_detalhe; ?>">
                        <td contenteditable="false" data-field="dta_aula" class="text-center">
                            <?php echo databr($detalhe->dta_aula); ?></td>
                        <td contenteditable="false" data-field="qtde_matriculado" class="text-center">
                            <?php echo $detalhe->qtde_matriculado; ?></td>
                        <td contenteditable="false" data-field="qtde_presenca" class="text-center">
                            <?php echo $detalhe->qtde_presenca; ?>
                        </td>
                        <td contenteditable="false" data-field="qtde_falta" class="text-center">
                            <?php echo $detalhe->qtde_falta; ?></td>
                        <td contenteditable="false" data-field="qtde_visitante" class="text-center">
                            <?php echo $detalhe->qtde_visitante; ?>
                        </td>
                        <td contenteditable="false" data-field="qtde_biblia" class="text-center">
                            <?php echo $detalhe->qtde_biblia; ?></td>
                        <td contenteditable="false" data-field="qtde_revista" class="text-center">
                            <?php echo $detalhe->qtde_revista; ?></td>
                        <td contenteditable="false" data-field="valor_oferta" class="text-center">
                            R$ <?php echo $detalhe->valor_oferta; ?></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table-responsive">
            <table class="table table-editable table-nowrap align-middle table-edits">
                <thead>
                    <th class="text-center"><i class="fas fa-poll-h"></i> Observação</th>
                </thead>
                <tbody>
                    <tr class="text-center">
                        <td contenteditable="false" data-field="observacao"><?php echo $detalhe->observacao; ?></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<header class="spacer"></header>
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
                                <input type="number" class="form-control" name="qtde_biblia"
                                    value="<?php echo $detalhe->qtde_biblia ?>" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="qtde_revista">Total de Revista:</label>
                                <input type="number" class="form-control" name="qtde_revista"
                                    value="<?php echo $detalhe->qtde_revista ?>" />
                            </div>
                        </div>
                    </div>
                    <header class="spacer"></header>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="qtde_visitante">Total de Visitante:</label>
                                <input type="number" class="form-control" name="qtde_visitante"
                                    value="<?php echo $detalhe->qtde_visitante ?>" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="valor_oferta">Ofertas:</label>
                                <input type="text" class="form-control mascara-dinheiro2" name="valor_oferta"
                                    value="<?php echo $detalhe->valor_oferta ?>" />
                            </div>
                        </div>
                    </div>
                    <header class="spacer"></header>
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
                    <button type="submit" class="btn btn-primary w-md waves-effect waves-light">Salvar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
let presencasAlteradas = [];

function marcarPresenca(id_aluno, presente) {
    let valor_presenca = presente ? 'P' : 'F';
    presencasAlteradas.push({
        id_aluno: id_aluno,
        presente: valor_presenca
    });
}

function salvarAlteracoes() {
    if (presencasAlteradas.length === 0) {
        alert("Nenhuma alteração para salvar.");
        return;
    }

    $.ajax({
        url: '<?php echo URL_BASE; ?>aulaDetalheClasse/atualizarPresencas',
        type: 'POST',
        data: JSON.stringify({
            id_aula: <?php echo $detalhe->id_aula; ?>,
            id_classe: <?php echo $detalhe->id_classe; ?>,
            presencas: presencasAlteradas
        }),
        contentType: 'application/json',
        success: function(response) {
            alert("Alterações realizadas com sucesso.");
            location.reload(); // Recarrega a página após o sucesso da atualização
        },
        error: function(error) {
            console.log(error);
        }
    });
}
</script>