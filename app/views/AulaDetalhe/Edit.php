<div class="container">
    <h4>Editar Detalhe da Aula</h4>
    <?php $this->verMsg(); $this->verErro();?>
    <form action="<?php echo URL_BASE . "auladetalhe/salvar" ?>" method="post">
        <input type="hidden" name="id_aula" value="<?php echo $aulaDetalhe->id_aula ?>">
        <input type="hidden" name="id_classe" value="<?php echo $aulaDetalhe->id_classe ?>">

        <div class="form-group">
            <label for="qtde_biblia">Quantidade de Bíblias</label>
            <input type="number" name="qtde_biblia" id="qtde_biblia" class="form-control"
                value="<?php echo $aulaDetalhe->qtde_biblia ?>">
        </div>

        <div class="form-group">
            <label for="qtde_revista">Quantidade de Revistas</label>
            <input type="number" name="qtde_revista" id="qtde_revista" class="form-control"
                value="<?php echo $aulaDetalhe->qtde_revista ?>">
        </div>

        <div class="form-group">
            <label for="qtde_visitante">Quantidade de Visitantes</label>
            <input type="number" name="qtde_visitante" id="qtde_visitante" class="form-control"
                value="<?php echo $aulaDetalhe->qtde_visitante ?>">
        </div>

        <div class="form-group">
            <label for="valor_oferta">Valor da Oferta</label>
            <input type="number" step="0.01" name="valor_oferta" id="valor_oferta" class="form-control"
                value="<?php echo $aulaDetalhe->valor_oferta ?>">
        </div>

        <div class="form-group">
            <label for="observacao">Observação</label>
            <textarea name="observacao" id="observacao"
                class="form-control"><?php echo $aulaDetalhe->observacao ?></textarea>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary">Salvar</button>
            <a href="<?php echo URL_BASE . "auladetalhe" ?>" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</div>