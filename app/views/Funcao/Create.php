<div class="row">
    <div class="col-sm-6">
        <div class="page-title-box">
            <?php           
           if ($funcao->id_funcao ?? null) {
            echo "Editar Função";
            } else {
            echo "Cadastrar Função";
             }
        ?>
        </div>
    </div>
</div>
<?php $this->verMsg(); $this->verErro();?>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <form action="<?php echo URL_BASE . "funcao/salvar" ?>" method="post">
                    <div class="row">
                        <div class="col-sm">
                            <h6>Função</h6>
                            <input type="hidden" name="id_funcao" value="<?php echo $funcao->id_funcao ?? null ?>">
                            <input type="text" class="form-control " name="funcao" id="funcao"
                                value="<?php echo $funcao->funcao ?? null ?>" required>
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <div class="col-sm-4">
                            <button type="submit" class="btn btn-primary">
                                <i class="ion ion-md-save"></i>
                                Salvar
                            </button>
                            <a href="<?php echo URL_BASE . "funcao" ?>" class="btn btn-success" role="button"
                                aria-pressed="true">
                                <i class="ion ion-md-return-left"></i>
                                Voltar
                            </a>
                        </div>
                    </div>
                    <div><br></div>
                </form>
            </div>
        </div>
    </div>
</div>