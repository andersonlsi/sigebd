<script src="<?php echo URL_BASE ?>assets/js/CadPermissao.js"></script>
<div class="d-flex justify-content-between align-items-center">
    <div>
        <h4>Lista de Permissão de Usuário</h4>
    </div>
    <div>
        <button type="button" class="btn btn-success waves-effect waves-light" onclick="abrirModal()">
            <i class="ion ion-md-add-circle-outline"></i>
            Novo
        </button>
    </div>
</div>
<div><br></div>
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
                            <th>Permissão</th>
                            <th>Descrição</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($lista as $p) { ?>
                        <tr>
                            <td><?php echo $p->id_permissao ?></td>
                            <td><?php echo $p->permissao ?></td>
                            <td><?php echo $p->descricao ?></td>
                            <td>
<!--                                <a href="<?php //echo URL_BASE . "Permissao/permissao/" . $p->id_permissao ?>" class=""><i
                                        class="far fas fa-list"></i></a>
                                &nbsp;&nbsp;-->
                                <a href="javascript:;" onclick="buscarPermissao(<?php echo $p->id_permissao ?>)" class="">
                                    <i class="far fa-edit"></i>
                                </a>
                                &nbsp;&nbsp;
                                <a href="javascript: if(confirm('ATENÇÃO: Essa ação não pode ser desfeita! Tem certeza que deseja excluir esse lançamento?')){
                                                    window.location.href='<?php echo URL_BASE . "Permissao/excluir/" . $p->id_permissao ?>'
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

<!-- Modal -->
<div class="modal fade" id="cad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Cadastrar Permissao</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?php echo URL_BASE . 'Permissao/salvar' ?>" id="frmPermissao" name="frmPermissao" method="post">
                    <div class="row">
                        <div class="col-sm">
                            <h6>Permissao</h6>
                            <input type="hidden" name="id_permissao" id="id_permissao" value="">
                            <input type="text" class="form-control" name="permissao" id="permissao" value="" required>
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <div class="col-sm">
                            <h6>Descrição</h6>
                            <textarea class="form-control" id="descricao" name="descricao"></textarea>
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