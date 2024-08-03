<link href="<?php echo URL_BASE?>assets/css/aula.css" rel="stylesheet" type="text/css" />
<div class="d-flex justify-content-between align-items-center">
    <div>
        <h4>Lista de Aulas</h4>
    </div>
    <div>
        <button type="button" class="btn btn-success waves-effect waves-light" onclick="abrirModal()">
        <i class="ion ion-md-add-circle-outline large-icon"></i>            
        </button>
    </div>
</div>
<div><br></div>
<?php $this->verMsg(); $this->verErro();?>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <?php if (empty($lista)) { ?>
                                <p class="text-center">Nenhuma aula cadastrada no momento.</p>
                                <?php } else { ?>
                                <div id="scrollable-list" class="scrollable-list">
                                    <?php foreach ($lista as $a) { ?>
                                    <div class="list-item">
                                        <div class="item-header">
                                            <span class="lesson">Lição: <strong><?php echo $a->numero ?></strong></span>
                                            <span class="separator">&nbsp;&nbsp;</span>
                                            <span class="date">Data: <strong><?php echo databr($a->dta_aula) ?></strong></span>                                           
                                        </div>                                        
                                        <div class="item-content">                                       
                                            <p class="details">                                                
                                                Matriculados: <strong><?php echo $a->total_matriculado ?></strong>
                                                <span class="separator">&nbsp;&nbsp;</span>
                                                Presentes: <strong><?php echo $a->total_presenca ?></strong>
                                                <span class="separator">&nbsp;&nbsp;</span>
                                                Ausentes: <strong><?php echo $a->total_falta ?></strong>
                                            </p>
                                        </div>
                                        <div class="item-actions">
                                            <a href="<?php echo URL_BASE . "aulaDetalhe/index/" . $a->id_aula ?>"
                                                class="btn btn-link p-0"><i class="far fas fa-list"></i></a>
                                            &nbsp;&nbsp;
                                            <a href="javascript: if(confirm('ATENÇÃO: Essa ação não pode ser desfeita! Tem certeza que deseja excluir esse lançamento?')){
                                                    window.location.href='<?php echo URL_BASE . "aula/excluir/" . $a->id_aula ?>'
                                                }" class="btn btn-link p-0">
                                                <i class="far fa-trash-alt"></i></a>
                                        </div>
                                    </div>
                                    <?php } ?>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
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
<script src="<?php echo URL_BASE ?>assets/js/CadAula.js"></script>
