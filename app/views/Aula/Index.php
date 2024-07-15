<div class="row">
    <div class="col-sm-6">
        <div class="page-title-box">
            <h4>Aulas</h4>
        </div>
    </div>
    <form action="<?php echo URL_BASE . "aula/salvar" ?>" method="post">
        <div class="row">
            <div class="col-sm">
                <h6>Data</h6>
                <input type="hidden" name="id_aula" value="<?php echo $aula->id_aula ?? null ?>">
                <input type="date" class="form-control " name="data_aula" id="data_aula"
                    value="<?php echo $aula->data_aula ?? date('Y-m-d') ?>" required>
            </div>
            <div class="col-sm">
                <h6>Lição</h6>
                <input type="number" class="form-control " name="numero" id="numero"
                    value="<?php echo $aula->numero ?? null ?>" required>
            </div>
        </div>
        <div><br></div>
        <div class="row">
            <div class="col-sm-4">
                <button type="submit" class="btn btn-primary">
                    <i class="ion ion-md-save"></i>
                    Salvar
                </button>
            </div>
        </div>
        <div><br></div>
    </form>

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
                            <th>Data</th>
                            <th>Lição</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($lista as $a) { ?>
                        <tr>
                            <td><?php echo databr($a->data_aula)?></td>
                            <td><?php echo $a->numero ?></td>
                            <td>
                                <a href="<?php echo URL_BASE . "aula/viewClass/" . $a->id_aula ?>" class=""><i
                                        class="far fas fa-eye"></i></a>&nbsp;&nbsp;
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