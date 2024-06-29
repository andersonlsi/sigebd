<div class="row">
    <div class="col-sm-6">
        <div class="page-title-box">
            <?php           
           if ($classe->id_classe ?? null) {
            echo "Editar Classe";
            } else {
            echo "Cadastrar Classe";
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

                <form action="<?php echo URL_BASE . "classe/salvar" ?>" method="post">
                    <div class="row">
                        <div class="col-6">
                            <h6>Classe</h6>
                            <input type="hidden" name="id_classe" value="<?php echo $classe->id_classe ?? null ?>">
                            <input type="text" class="form-control " name="classe" id="classe"
                                value="<?php echo $classe->classe ?? null ?>" required>
                        </div>
                        <div class="col-6">

                            <label class="form-label">Faixa Etária</label>
                            <select class="form-control select2" name="id_faixa_etaria" id="id_faixa_etaria">                                
                                <?php foreach($faixa_etaria as $f){ 
                                echo "<option value='$f->id_faixa_etaria'>$f->id_faixa_etaria - $f->faixa_etaria</option>";
                            }?>
                            </select>
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <div class="col">
                            <h6>Descrição</h6>
                            <input type="text" class="form-control " name="descricao" id="descricao"
                                value="<?php echo $classe->descricao ?? null ?>">
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <div class="col-sm-4">
                            <button type="submit" class="btn btn-primary">
                                <i class="ion ion-md-save"></i>
                                Salvar
                            </button>
                            <a href="<?php echo URL_BASE . "classe" ?>" class="btn btn-success" role="button"
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