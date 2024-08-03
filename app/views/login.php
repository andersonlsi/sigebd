<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <title>SIGED</title>
    <link rel="shortcut icon" href="" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="Sistema de Gestão de Escola Dominical" name="description" />
    <meta content="Radial Software" name="Anderson Siqueira" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="<?php echo URL_BASE?>assets/images/logo_icone.png">

    <!-- Bootstrap Css -->
    <link href="<?php echo URL_BASE?>assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet"
        type="text/css" />
    <!-- Icons Css -->
    <link href="<?php echo URL_BASE?>assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="<?php echo URL_BASE?>assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <style>
    /* Media query to hide the footer in mobile view */
    @media (max-width: 576px) {
        .mobile-hidden {
            display: none;
        }
    }

    /* Ensuring the login card is centered */
    .account-pages {
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
    }
    </style>

</head>

<body>
    <div class="account-pages">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card overflow-hidden">
                        <div class="card-body pt-0">

                            <h3 class="text-center mt-5 mb-4">
                                <a href="<?php echo URL_BASE?>" class="d-block auth-logo">
                                    <img src="<?php echo URL_BASE?>assets/images/logo.png" alt="" height="65" width=""
                                        class="auth-logo-dark">
                                    <img src="<?php echo URL_BASE?>assets/images/logo.png" alt="" height="65" width=""
                                        class="auth-logo-light">
                                </a>
                            </h3>

                            <div class="p-3">
                                <?php $this->verMsg(); $this->verErro();?>
                                <form class="form-horizontal mt-4" action="<?php echo URL_BASE . "login/logar" ?>"
                                    method="post">
                                    <div class="mb-3">
                                        <label for="username">Usuário</label>
                                        <input type="email" class="form-control" id="email" name="email"
                                            placeholder="Entra com E-mail">
                                    </div>
                                    <div class="mb-3">
                                        <label for="userpassword">Senha</label>
                                        <input type="password" class="form-control" id="senha" name="senha"
                                            placeholder="Entra com a senha">
                                    </div>
                                    <div class="mb-3 row mt-4">
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input"
                                                    id="customControlInline">
                                                <label class="form-check-label" for="customControlInline">Lembre de mim
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-6 text-end">
                                            <button class="btn btn-primary w-md waves-effect waves-light" type="submit"
                                                id="submit">Entrar</button>
                                        </div>
                                    </div>
                                    <div class="form-group mb-0 row">
                                        <div class="col-12 mt-4">
                                            <a href="pages-recoverpw.html" class="text-muted"><i
                                                    class="mdi mdi-lock"></i> Esqueceu sua senha?</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="mt-5 text-center">
                        &copy;Copyright <?php echo date('Y')?><strong> | SIGEBD - Sistema de Gestão de Escola
                            Dominical</strong>.
                        Todos os direitos reservados. Desenvolvido por <a href="https://www.andersonls.com.br/"
                            target="_blank">Anderson
                            Siqueira.</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JAVASCRIPT -->
    <script src="<?php echo URL_BASE?>assets/libs/jquery/jquery.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/js/timeAlert.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/metismenu/metisMenu.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/simplebar/simplebar.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/node-waves/waves.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!-- App js -->
    <script src="<?php echo URL_BASE?>assets/js/app.js"></script>
</body>

</html>