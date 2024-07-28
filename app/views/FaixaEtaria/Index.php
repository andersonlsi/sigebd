<script src="<?php echo URL_BASE ?>assets/js/CadFaixaEtaria.js"></script>
<div class="d-flex justify-content-between align-items-center">
    <div>
        <h4>Lista de Faixa Etária</h4>
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
                            <th>Faixa Etária</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($lista as $f) { ?>
                        <tr>
                            <td><?php echo $f->id_faixa_etaria ?></td>
                            <td><?php echo $f->faixa_etaria ?></td>
                            <td>
                                <a href="javascript:;" onclick="buscarFaixaEtaria(<?php echo $f->id_faixa_etaria ?>)"
                                    class="">
                                    <i class="far fa-edit"></i>
                                </a>
                                &nbsp;&nbsp;
                                <a href="javascript: if(confirm('ATENÇÃO: Essa ação não pode ser desfeita! Tem certeza que deseja excluir esse lançamento?')){
                                                    window.location.href='<?php echo URL_BASE . "FaixaEtaria/excluir/" . $f->id_faixa_etaria ?>'
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
                <h5 class="modal-title" id="modalTitle">Cadastrar Faixa Etária</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?php echo URL_BASE . 'FaixaEtaria/salvar' ?>" id="frmFaixaEtaria" name="frmFaixaEtaria"
                    method="post">
                    <div class="row">
                        <div class="col-sm">
                            <h6>Faixa Etária</h6>
                            <input type="hidden" name="id_faixa_etaria" id="id_faixa_etaria" value="">
                            <input type="text" class="form-control" name="faixa_etaria" id="faixa_etaria" value=""
                                required>
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