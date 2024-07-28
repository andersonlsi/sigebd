<script src="<?php echo URL_BASE ?>assets/js/CadAula.js"></script>
<div class="d-flex justify-content-between align-items-center">
    <div>
        <h4>Aulas</h4>
    </div>
    <div>
        <button type="button" class="btn btn-success waves-effect waves-light" onclick="abrirModal()">
            <i class="ion ion-md-add-circle-outline"></i>
            Nova Aula
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
                            <th>Data</th>
                            <th>Lição</th>
                            <th>Resumo</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($lista as $a) { ?>
                        <tr>
                            <td><?php echo databr($a->dta_aula)?></td>
                            <td><?php echo $a->numero ?></td>
                            <td>
                                Matriculados: <strong><?php echo $a->total_matriculado ?></strong> |
                                Presentes: <strong><?php echo $a->total_presenca ?></strong> |
                                Ausentes: <strong><?php echo $a->total_falta ?></strong>
                            </td>
                            <td>
                                <a href="<?php echo URL_BASE . "aulaDetalhe/index/" . $a->id_aula ?>" class=""><i
                                        class="far fas fa-list"></i></a>
                                &nbsp;&nbsp;
                                <a href="javascript: if(confirm('ATENÇÃO: Essa ação não pode ser desfeita! Tem certeza que deseja excluir esse lançamento?')){
                                                    window.location.href='<?php echo URL_BASE . "aula/excluir/" . $a->id_aula ?>'
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

<!-- Modal -->
<div class="modal fade" id="cad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Cadastro de Aula</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?php echo URL_BASE . 'aula/salvar' ?>" id="frm" name="frm" method="post">
                    <div class="row">
                        <div class="col-sm">
                            <h6>Data da Aula</h6>
                            <input type="hidden" name="id_aula" id="id_aula" value="">
                            <input type="date" class="form-control" name="dta_aula" id="dta_aula" value="" required>
                        </div>
                        <div class="col-sm">
                            <h6>Número da Aula</h6>
                            <input type="number" class="form-control " name="numero" id="numero" value="" required>
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