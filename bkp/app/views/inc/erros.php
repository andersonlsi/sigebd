<div class="alert alert-danger alert-dismissible fade show mb-0" role="alert">
    <button type="button" class="btn-close" id="close-alert" data-bs-dismiss="alert" aria-label="Close">
    </button>
    <i class="fas fa-bug"></i>
    <strong>Ops!</strong>
    Foram encontrados os seguintes erros:
    <ul>
        <?php foreach($erros as $erro){ ?>
        <li><?php echo $erro ?></li>
        <?php } ?>
    </ul>
    <span id="countdown"></span>
</div>