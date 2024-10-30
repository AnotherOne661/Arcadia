<?php
$ABS_URL = "/assets/";
?>
<header>
    <div id="nav1">
        <div id="logo">
            <a href="../index.php"><img src="<?php echo $ABS_URL; ?>images/altern.png" alt=""></a>
        </div>
        <div id="search">
            <form>
                <input type="search" placeholder="Buscar">
                <button type="submit"><img src="<?php echo
                    $ABS_URL; ?>images/icons/mag-glass.svg" alt=""></button>
            </form>
        </div>
        <div id="icons">
            <a href=""><img src="<?php echo
                $ABS_URL; ?>images/icons/user.svg " alt=""></a>
            <a href=""><img id="cart" src="<?php echo
                $ABS_URL; ?>images/icons/cart.svg" alt=""></a>
        </div>
        <div id="menu">
            <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
                aria-controls="offcanvasRight"><img src="<?php echo
                    $ABS_URL; ?>images/icons/open.jpg" alt=""></button>

            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
                aria-labelledby="offcanvasRightLabel">
                <div class="offcanvas-header">
                    <h5 id="offcanvasRightLabel">Menu</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                        aria-label="Close"><img src="<?php echo
                            $ABS_URL; ?>image/icons/close.jpg" alt=""></button>


                </div>
                <div class="offcanvas-body">
                    <div class="menu-buttons">
                        <div class="menu-button">

                            <!-- Example split danger button -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger">Accesorios</button>
                                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="visually-hidden">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Magic: The Gathering</a></li>
                                    <li><a class="dropdown-item" href="#">Yu-Gi-Oh!</a></li>
                                    <li><a class="dropdown-item" href="#">Pokémon</a></li>
                                    <li><a class="dropdown-item" href="#">Lorcana</a></li>
                                    <li><a class="dropdown-item" href="#">One Piece</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">General</a></li>
                                </ul>
                            </div>


                        </div>
                        <div class="menu-button">

                            <!-- Example split danger button -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger">Eventos</button>
                                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="visually-hidden">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Magic: The Gathering</a></li>
                                    <li><a class="dropdown-item" href="#">Yu-Gi-Oh!</a></li>
                                    <li><a class="dropdown-item" href="#">Pokémon</a></li>
                                    <li><a class="dropdown-item" href="#">Lorcana</a></li>
                                    <li><a class="dropdown-item" href="#">One Piece</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Otros Eventos</a></li>
                                </ul>
                            </div>


                        </div>
                        <div class="menu-button">

                            <!-- Example split danger button -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger">Colecciones</button>
                                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="visually-hidden">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Magic: The Gathering</a></li>
                                    <li><a class="dropdown-item" href="#">Yu-Gi-Oh!</a></li>
                                    <li><a class="dropdown-item" href="#">Pokémon</a></li>
                                    <li><a class="dropdown-item" href="#">Lorcana</a></li>
                                    <li><a class="dropdown-item" href="#">One Piece</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <p>Productos generales</p>
                                    <li><a class="dropdown-item" href="#">Magic: The Gathering</a></li>
                                    <li><a class="dropdown-item" href="#">Yu-Gi-Oh!</a></li>
                                    <li><a class="dropdown-item" href="#">Pokémon</a></li>
                                    <li><a class="dropdown-item" href="#">Lorcana</a></li>
                                    <li><a class="dropdown-item" href="#">One Piece</a></li>
                                </ul>
                            </div>


                        </div>
                        <div class="menu-button">

                            <!-- Example split danger button -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger">Magic: The Gathering</button>
                                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="visually-hidden">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Colecciones</a></li>
                                    <li><a class="dropdown-item" href="#">Accesorios</a></li>
                                    <li><a class="dropdown-item" href="#">Productos sueltos</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Con Descuento</a></li>
                                </ul>
                            </div>


                        </div>
                        <div class="menu-button">

                            <!-- Example split danger button -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger">Yu-Gi-Oh!</button>
                                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="visually-hidden">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Colecciones</a></li>
                                    <li><a class="dropdown-item" href="#">Accesorios</a></li>
                                    <li><a class="dropdown-item" href="#">Productos sueltos</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Con Descuento</a></li>
                                </ul>
                            </div>


                        </div>
                        <div class="menu-button">

                            <!-- Example split danger button -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger">Lorcana</button>
                                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="visually-hidden">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Colecciones</a></li>
                                    <li><a class="dropdown-item" href="#">Accesorios</a></li>
                                    <li><a class="dropdown-item" href="#">Productos sueltos</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Con Descuento</a></li>
                                </ul>
                            </div>


                        </div>
                        <div class="menu-button">

                            <!-- Example split danger button -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger">Pokémon</button>
                                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="visually-hidden">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Colecciones</a></li>
                                    <li><a class="dropdown-item" href="#">Accesorios</a></li>
                                    <li><a class="dropdown-item" href="#">Productos sueltos</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Con Descuento</a></li>
                                </ul>
                            </div>


                        </div>
                        <div class="menu-button">

                            <!-- Example split danger button -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger">One Piece</button>
                                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="visually-hidden">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Colecciones</a></li>
                                    <li><a class="dropdown-item" href="#">Accesorios</a></li>
                                    <li><a class="dropdown-item" href="#">Productos sueltos</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Con Descuento</a></li>
                                </ul>
                            </div>


                        </div>


                    </div>


                </div>

            </div>
        </div>
    </div>
    </div>
    <div id="nav2">
        <nav>

            <a href="subpages/collections.php">Colecciones</a>
            <a href="calendar.php">Eventos</a>
            <a href="index.php">Accesorios</a>
            <a href="products.php">Magic The Gathering</a>
            <a href="subpages/contact.php">Yu-Gi-Oh</a>
            <a href="cart.php">Lorcana</a>
            <a href="login.php">One Piece TCG</a>
            <a href="login.php">Pokémon</a>

        </nav>
    </div>
</header>