<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <title>SIGED</title>
    <link rel="shortcut icon" href="" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- App favicon -->
    <link rel="shortcut icon" href="<?php echo URL_BASE?>assets/images/logo4.png">
    <!-- DataTables -->
    <link href="<?php echo URL_BASE?>assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet"
        type="text/css" />
    <link href="<?php echo URL_BASE?>assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css"
        rel="stylesheet" type="text/css" />

    <!-- Responsive datatable examples -->
    <link href="<?php echo URL_BASE?>assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"
        rel="stylesheet" type="text/css" />

    <!-- Bootstrap Css -->
    <link href="<?php echo URL_BASE?>assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet"
        type="text/css" />
    <!-- Icons Css -->
    <link href="<?php echo URL_BASE?>assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="<?php echo URL_BASE?>assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <style>
    .waves-light {
        background-color: #2B3A4A !important;
        /* Cor de fundo */
        color: #fff !important;
        /* Cor do texto */
        border: none !important;
        /* Remove a borda padrão */
        /*padding: 10px 20px !important; */
        /* Ajuste o padding conforme necessário */
        border-radius: 4px !important;
        /* Bordas arredondadas */
        cursor: pointer !important;
        /* Cursor de ponteiro ao passar sobre o botão */
    }

    .ti-arrow-left {
        color: #2B3A4A !important;
    }

    .spacer {
		height: 30px;
		/* Ajuste o valor conforme necessário */
	}
    </style>

    <script>
    var base_url = "<?php echo URL_BASE ?>";
    </script>
</head>

<!-- <body data-sidebar="dark" data-keep-enlarged="true" class="vertical-collpsed"> -->

<body data-sidebar="dark">
    <div id="layout-wrapper">
        <?php include "cabecalho.php" ?>
        <?php include "menu.php" ?>
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    <?php $this->load($view, $viewData); ?>
                </div>
            </div>
            <?php include "rodape.php" ?>
        </div>
    </div>

    <script src="<?php echo URL_BASE?>assets/libs/jquery/jquery.min.js"></script>
    <script src="<?php echo URL_BASE ?>assets/js/jquery.mask.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/metismenu/metisMenu.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/simplebar/simplebar.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/node-waves/waves.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/js/timeAlert.js"></script>
    <script src="<?php echo URL_BASE?>assets/js/mostrarMaisBtn.js"></script>
    <script src="<?php echo URL_BASE ?>assets/componentes/js/js_mascara.js"></script>

    <!-- Required datatable js -->
    <script src="<?php echo URL_BASE?>assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <!-- Buttons examples -->
    <script src="<?php echo URL_BASE?>assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/jszip/jszip.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/pdfmake/build/pdfmake.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/pdfmake/build/vfs_fonts.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/datatables.net-buttons/js/buttons.colVis.min.js"></script>
    <!-- Responsive examples -->
    <script src="<?php echo URL_BASE?>assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js">
    </script>
    <script src="<?php echo URL_BASE?>assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js">
    </script>

    <!-- Datatable init js -->
    <script src="<?php echo URL_BASE?>assets/js/pages/datatables.init.js"></script>

    <!--Morris Chart-->
    <script src="<?php echo URL_BASE?>assets/libs/morris.js/morris.min.js"></script>
    <script src="<?php echo URL_BASE?>assets/libs/raphael/raphael.min.js"></script>

    <script src="<?php echo URL_BASE?>assets/js/pages/dashboard.init.js"></script>

    <!-- App js -->
    <script src="<?php echo URL_BASE?>assets/js/app.js"></script>
</body>

</html>