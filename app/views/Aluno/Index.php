<div class="d-flex justify-content-between align-items-center">
    <div>
        <h4>Lista Geral de Alunos</h4>
    </div>
    <div>
        <a href="<?php echo URL_BASE . "aluno/Create" ?>" class="btn btn-success" role="button" aria-pressed="true">
            <i class="ion ion-md-add-circle-outline"></i>
            Novo
        </a>
    </div>
</div>
<div><br></div>
<?php $this->verMsg(); $this->verErro();?>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">
                <table id="datatable" class="table table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Classe</th>
                            <th>Matriculado</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($lista as $c) { ?>
                        <tr>
                            <td><?php echo $c->nome ?></td>
                            <td><?php echo $c->classe ?></td>
                            <td><?php echo $c->dta_matricula ?></td>
                            <td>
                                <a href="<?php echo URL_BASE . "aluno/edit/" . $c->id_aluno ?>" class=""><i
                                        class="far fa-edit"></i></a>&nbsp;&nbsp;
                                <a href="javascript: if(confirm('ATENÇÃO: Essa ação não pode ser desfeita! Tem certeza que deseja excluir esse lançamento?')){
                                                    window.location.href='<?php echo URL_BASE . "aluno/excluir/" . $c->id_aluno ?>'
                                                }">
                                    <i class="far fa-trash-alt"></i>
                                </a>
                            </td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>