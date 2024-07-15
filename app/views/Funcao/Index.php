<div class="row">
    <div class="col-sm-6">
        <div class="page-title-box">
            <h4>Lista de Funções</h4>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="state-information d-none d-sm-block">
            <div class="state-graph">
            </div>
            <div class="state-graph">
                <button type="button" class="btn btn-success waves-effect waves-light" data-bs-toggle="modal"
                    data-bs-target="#cad">
                    <i class="ion ion-md-add-circle-outline"></i>
                    Novo
                </button>
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
                            <th>Função</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($lista as $f) { ?>
                        <tr>
                            <td><?php echo $f->id_funcao ?></td>
                            <td><?php echo $f->funcao ?></td>
                            <td>
                                <!-- <a href="<?php //echo URL_BASE . "funcao/edit/" . $f->id_funcao ?>" class=""><i
                                        class="far fa-edit"></i></a>&nbsp;&nbsp; -->

                                <a href="<?php echo URL_BASE . "funcao/edit/" . $f->id_funcao ?>" data-bs-toggle="modal" data-bs-target="#edit">
                                    <i class="far fa-edit"></i>
                                </a>
                                &nbsp;&nbsp;
                                <a href="javascript: if(confirm('ATENÇÃO: Essa ação não pode ser desfeita! Tem certeza que deseja excluir esse lançamento?')){
                                                    window.location.href='<?php echo URL_BASE . "funcao/excluir/" . $f->id_funcao ?>'
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

<div class="modal fade" id="cad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">
                    <?php           
                        if ($funcao->id_funcao ?? null) {
                            echo "Editar Função";
                        } else {
                            echo "Cadastrar Função";
                        }
                    ?>
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?php echo URL_BASE . "funcao/salvar" ?>" method="post">
                    <div class="row">
                        <div class="col-sm">
                            <h6>Função</h6>
                            <input type="hidden" name="id_funcao" value="<?php echo $funcao->id_funcao ?? null ?>">
                            <input type="text" class="form-control " name="funcao" id="funcao"
                                value="<?php echo $funcao->funcao ?? null ?>" required>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary waves-effect waves-light">Salvar</button>
            </div>
            </form>
        </div>
    </div>
</div>
<?php include "Edit.php" ?>