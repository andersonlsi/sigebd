<!-- <div class="alert alert-success alert-dismissible fade show" role="alert">
    <button type="button" class="btn-close" id="close-alert" data-bs-dismiss="alert" aria-label="Close">
    </button>
    <i class="fas fa-check"></i>
    <strong>Sucesso!</strong>
    <?php //echo $msg->msg; ?> -->
<!-- <span id="countdown"></span> -->
<!-- </div> -->


<?php if(isset($msg)): ?>
<div class="alert <?php echo $msg->class; ?> alert-dismissible fade show" role="alert">
    <button type="button" class="btn-close" id="close-alert" data-bs-dismiss="alert" aria-label="Close">
    </button>
    <i class="<?php echo $msg->icone; ?>"></i>
    <strong><?php echo $msg->tipo == -1 ? 'Erro!' : ($msg->tipo == 2 ? 'Informação!' : 'Sucesso!'); ?></strong>
    <?php echo $msg->msg; ?>
</div>
<?php endif; ?>