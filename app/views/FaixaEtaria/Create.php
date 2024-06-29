<div class="row">
    <div class="col-sm-6">
        <div class="page-title-box">
            <?php           
           if ($faixa_etaria->id_faixa_etaria ?? null) {
            echo "Editar Faixa Etária";
            } else {
            echo "Cadastrar Faixa Etária";
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

                <form action="<?php echo URL_BASE . "FaixaEtaria/salvar" ?>" method="post">
                    <div class="row">
                        <div class="col-sm">
                            <h6>Faixa Etária</h6>
                            <input type="hidden" name="id_faixa_etaria"
                                value="<?php echo $faixa_etaria->id_faixa_etaria ?? null ?>">
                            <input type="text" class="form-control " name="faixa_etaria" id="faixa_etaria"
                                value="<?php echo $faixa_etaria->faixa_etaria ?? null ?>" required>
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <div class="col-sm-4">
                            <button type="submit" class="btn btn-primary">
                                <i class="ion ion-md-save"></i>
                                Salvar
                            </button>
                            <a href="<?php echo URL_BASE . "FaixaEtaria" ?>" class="btn btn-success" role="button"
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