<script src="<?php echo URL_BASE ?>assets/js/CadUsuario.js"></script>
<div class="d-flex justify-content-between align-items-center">
    <div>
        <h4>Lista de Usuários</h4>
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
                            <th>Usuário</th>
                            <th>Email</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($lista as $u) { ?>
                        <tr>
                            <td><?php echo $u->id_usuario ?></td>
                            <td><?php echo $u->usuario ?></td>
                            <td><?php echo $u->email ?></td>
                            <td>
                                <a href="javascript:;" onclick="buscarUsuario(<?php echo $u->id_usuario ?>)" class="">
                                    <i class="far fa-edit"></i>
                                </a>
                                &nbsp;&nbsp;
                                <a href="javascript: if(confirm('ATENÇÃO: Essa ação não pode ser desfeita! Tem certeza que deseja excluir esse lançamento?')){
                                                    window.location.href='<?php echo URL_BASE . "Usuario/excluir/" . $u->id_usuario ?>'
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
                <h5 class="modal-title" id="modalTitle">Cadastrar Usuário</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?php echo URL_BASE . 'Usuario/salvar' ?>" id="frmUsuario" name="frmUsuario"
                    method="post">
                    <div class="row">
                        <div class="col-sm">
                            <h6>Usuário</h6>
                            <input type="hidden" name="id_usuario" id="id_usuario" value="">
                            <input type="text" class="form-control" name="usuario" id="usuario" value="" required>
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <div class="col-sm">
                            <h6>E-mail</h6>
                            <input type="email" class="form-control" name="email" id="email" value="" required>
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <div class="col-sm">
                            <h6>Senha</h6>
                            <input type="password" class="form-control" name="senha" id="senha" value="" required>
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