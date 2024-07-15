<header id="page-topbar">
    <div class="navbar-header">
        <div class="d-flex">
            <!-- LOGO -->
            <div class="navbar-brand-box">
                <a href="<?php echo URL_BASE?>" class="logo logo-dark">
                    <span class="logo-sm">
                        <img src="assets/images/logo-sm.png" alt="" height="22">
                    </span>
                    <span class="logo-lg">
                        <img src="assets/images/logo3.png" alt="" height="17">
                    </span>
                </a>

                <a href="<?php echo URL_BASE?>" class="logo logo-light">
                    <span class="logo-sm">
                        <img src="<?php echo URL_BASE?>assets/images/logo01.png" alt="" height="22">
                    </span>
                    <span class="logo-lg">
                        <img src="<?php echo URL_BASE?>assets/images/logo3.png" alt="" height="18">
                    </span>
                </a>
            </div>
            <button type="button" class="btn btn-sm px-3 font-size-24 header-item waves-effect vertical-menu-btn">
                <i class="mdi mdi-menu"></i>
            </button>
        </div>
        <div class="d-flex">

            <div class="dropdown d-none d-lg-inline-block">
                <button type="button" class="btn header-item noti-icon waves-effect" data-toggle="fullscreen">
                    <i class="mdi mdi-fullscreen font-size-24"></i>
                </button>
            </div>

            <!-- Notificações -->
            <!-- <div class="dropdown d-inline-block ms-1">
            <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-notifications-dropdown"
                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="ti-bell"></i>
                <span class="badge text-bg-danger rounded-pill">3</span>
            </button>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                aria-labelledby="page-header-notifications-dropdown">
                <div class="p-3">
                    <div class="row align-items-center">
                        <div class="col">
                            <h5 class="m-0"> Notifications (258) </h5>
                        </div>
                    </div>
                </div>
                <div data-simplebar style="max-height: 230px;">
                    <a href="javascript:void(0);" class="text-reset notification-item">
                        <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                                <div class="avatar-xs">
                                    <span class="avatar-title border-success rounded-circle ">
                                        <i class="mdi mdi-cart-outline"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="flex-grow-1">
                                <h6 class="mb-1">Your order is placed</h6>
                                <div class="text-muted">
                                    <p class="mb-1">If several languages coalesce the grammar</p>
                                </div>
                            </div>
                        </div>
                    </a>

                    <a href="javascript:void(0);" class="text-reset notification-item">
                        <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                                <div class="avatar-xs">
                                    <span class="avatar-title border-warning rounded-circle ">
                                        <i class="mdi mdi-message"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="flex-grow-1">
                                <h6 class="mb-1">New Message received</h6>
                                <div class="text-muted">
                                    <p class="mb-1">You have 87 unread messages</p>
                                </div>
                            </div>
                        </div>
                    </a>

                    <a href="javascript:void(0);" class="text-reset notification-item">
                        <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                                <div class="avatar-xs">
                                    <span class="avatar-title border-info rounded-circle ">
                                        <i class="mdi mdi-glass-cocktail"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="flex-grow-1">
                                <h6 class="mb-1">Your item is shipped</h6>
                                <div class="text-muted">
                                    <p class="mb-1">It is a long established fact that a reader will</p>
                                </div>
                            </div>
                        </div>
                    </a>

                    <a href="javascript:void(0);" class="text-reset notification-item">
                        <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                                <div class="avatar-xs">
                                    <span class="avatar-title border-primary rounded-circle ">
                                        <i class="mdi mdi-cart-outline"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="flex-grow-1">
                                <h6 class="mb-1">Your order is placed</h6>
                                <div class="text-muted">
                                    <p class="mb-1">Dummy text of the printing and typesetting industry.</p>
                                </div>
                            </div>
                        </div>
                    </a>

                    <a href="javascript:void(0);" class="text-reset notification-item">
                        <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                                <div class="avatar-xs">
                                    <span class="avatar-title border-warning rounded-circle ">
                                        <i class="mdi mdi-message"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="flex-grow-1">
                                <h6 class="mb-1">New Message received</h6>
                                <div class="text-muted">
                                    <p class="mb-1">You have 87 unread messages</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="p-2 border-top">
                    <a class="btn btn-sm btn-link font-size-14 w-100 text-center" href="javascript:void(0)">
                        View all
                    </a>
                </div>
            </div>
        </div> -->


            <div class="dropdown d-inline-block">
                <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img class="rounded-circle header-profile-user"
                        src="<?php echo URL_BASE?>assets/images/users/logo.png" alt="Header Avatar">
                </button>
                <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item"
                        href="javascript:void(0);"><?php // echo $_SESSION[SESSION_LOGIN]->nome ?></a>
                    <a class="dropdown-item" href="<?php echo URL_BASE . "Perfil" ?>"><i
                            class="mdi mdi-account-circle font-size-17 text-muted align-middle me-1"></i> Meu Perfil</a>
                    <a class="dropdown-item d-flex align-items-center" href="<?php echo URL_BASE . "Configuracao" ?>"><i
                            class="mdi mdi-cog font-size-17 text-muted align-middle me-1"></i> Configurações</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item text-danger"
                        href="javascript: if(confirm('Deseja realmente sair?')){window.location.href='<?php // echo URL_BASE . "login/logoff" ?>'}">
                        <i class="mdi mdi-power font-size-17 text-muted align-middle me-1 text-danger"></i> Logout</a>
                </div>
            </div>
        </div>
    </div>
</header>