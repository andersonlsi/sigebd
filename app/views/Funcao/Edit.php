<div class="modal fade" id="edit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">
                    Editar Função
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?php echo URL_BASE . "funcao/salvar" ?>" method="post">
                    <div class="row">
                        <div class="col-sm">
                            <h6>Função</h6>
                            <input type="hidden" name="id_funcao" value="<?php echo $funcao->id_funcao ?? null ?>">
                            <input type="text" class="form-control " name="funcao" id="funcao"
                                value="<?php echo $funcao->funcao ?? null ?>" required>
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