<div class="row">
    <div class="col-sm-6">
        <div class="page-title-box">
            <?php           
           if ($categoria->id_categoria ?? null) {
            echo "Editar Categoria";
            } else {
            echo "Cadastrar Categoria";
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

                <form action="<?php echo URL_BASE . "categoria/salvar" ?>" method="post">
                    <div class="row">
                        <div class="col-sm">
                            <h6>Categoria</h6>
                            <input type="hidden" name="id_categoria"
                                value="<?php echo $categoria->id_categoria ?? null ?>">
                            <input type="text" class="form-control " name="categoria" id="categoria"
                                value="<?php echo $categoria->categoria ?? null ?>" required>
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <div class="col-sm-4">
                            <button type="submit" class="btn btn-primary">
                                <i class="ion ion-md-save"></i>
                                Salvar
                            </button>
                            <a href="<?php echo URL_BASE . "categoria" ?>" class="btn btn-success" role="button"
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