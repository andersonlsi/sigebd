<script src="<?php echo URL_BASE ?>assets/js/CadClasse.js"></script>
<div class="d-flex justify-content-between align-items-center">
    <div>
        <h4>Lista de Classes</h4>
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
                                <a href="javascript:;" onclick="buscarClasse(<?php echo $c->id_classe ?>)" class="">
                                    <i class="far fa-edit"></i>
                                </a>
                                &nbsp;&nbsp;
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

<div class="modal fade bs-example-modal-xl" id="cad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Cadastrar Classe</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?php echo URL_BASE . "classe/salvar" ?>" id="frm" name="frm" method="post">
                    <div class="row">
                        <div class="col-sm">
                            <label class="form-label">Classe</label>
                            <input type="hidden" name="id_classe" id="id_classe" value="">
                            <input type="text" class="form-control" name="classe" id="classe" value="" required>
                        </div>
                        <div class="col-sm">
                            <label class="form-label">Faixa Etária</label>
                            <select class="form-control select2" name="id_faixa_etaria" id="id_faixa_etaria">
                                <?php foreach ($faixa_etaria as $f) {
                                        $selected = (isset($classe) && $classe->id_faixa_etaria == $f->id_faixa_etaria) ? 'selected' : '';
                                        echo "<option value='{$f->id_faixa_etaria}' {$selected}>{$f->id_faixa_etaria} - {$f->faixa_etaria}</option>";
                                }?>
                            </select>
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <div class="col-sm">
                            <label class="form-label">Descrição</label>
                            <input type="text" class="form-control" name="descricao" id="descricao" value="">
                        </div>
                    </div>
                    <div><br></div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary waves-effect waves-light"
                    onclick="document.frm.submit();">Salvar</button>
            </div>
        </div>
    </div>
</div>