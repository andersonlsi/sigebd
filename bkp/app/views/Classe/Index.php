<div class="row">
    <div class="col-sm-6">
        <div class="page-title-box">
            <h4>Lista de Classes</h4>

        </div>
    </div>
    <div class="col-sm-6">
        <div class="state-information d-none d-sm-block">
            <div class="state-graph">
            </div>
            <div class="state-graph">
                <a href="<?php echo URL_BASE . "classe/Create" ?>" class="btn btn-success" role="button"
                    aria-pressed="true">
                    <i class="ion ion-md-add-circle-outline"></i>
                    Novo Cadastro</a>
            </div>
        </div>
    </div>
</div>
<?php $this->verMsg(); $this->verErro();?>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <table id="datatable" class="table table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Classe</th>
                            <th>Faixa Etária</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($lista as $c) { ?>
                        <tr>
                            <td><?php echo $c->id_classe ?></td>
                            <td><?php echo $c->classe ?></td>
                            <td><?php echo $c->faixa_etaria ?></td>
                            <td>
                                <a href="<?php echo URL_BASE . "classe/edit/" . $c->id_classe ?>" class=""><i
                                        class="far fa-edit"></i></a>&nbsp;&nbsp;
                                <a href="javascript: if(confirm('ATENÇÃO: Essa ação não pode ser desfeita! Tem certeza que deseja excluir esse lançamento?')){
                                                    window.location.href='<?php echo URL_BASE . "classe/excluir/" . $c->id_classe ?>'
                                                }">
                                    <i class="far fa-trash-alt"></i></a>

                            </td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>