<?php $ABS_URL = "/assets/"; ?>
<header>
    <div id="nav1">
        <div id="logo">
            <a href="/home"><img src="<?php echo $ABS_URL; ?>images/altern.png" alt=""></a>
        </div>
        <div id="search">
            <form>
                <input type="search" placeholder="Buscar">
                <button type="submit"><img src="<?php echo
                    $ABS_URL; ?>images/icons/mag-glass.svg" alt=""></button>
            </form>
        </div>
        <div id="icons">
            <button class="btn btn-primary">
                <a href="/myPage"><i class="bi bi-person"></i></a>
            </button>
            <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
                aria-controls="offcanvasRight" onclick="hideMenu()"><i class="bi bi-cart"></i></button>

        </div>



        <!--

-->



        <div id="menu">
            <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
                aria-controls="offcanvasRight" onclick="hideCart()"><i class="bi bi-list"></i></button>

            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
                aria-labelledby="offcanvasRightLabel">
                <div class="offcanvas-header">
                    <h5 id="offcanvasRightLabel" class="menuTitle"></h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                        aria-label="Close"><img src="<?php echo
                            $ABS_URL; ?>image/icons/close.jpg" alt=""></button>


                </div>
                <div class="offcanvas-body">
                    <div class="menu">
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
                                    <button type="button" class="btn btn-danger" data-collections>Colecciones</button>
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
                                        <li><a class="dropdown-item" href="#" data-collections>Colecciones</a></li>
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
                                        <li><a class="dropdown-item" href="#" data-collections>Colecciones</a></li>
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
                                        <li><a class="dropdown-item" href="#" data-collections>Colecciones</a></li>
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
                                        <li><a class="dropdown-item" href="#" data-collections>Colecciones</a></li>
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
                                        <li><a class="dropdown-item" href="#" data-collections>Colecciones</a></li>
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
                    <div class="cart">
                        <div id="cart">
                            <div class="cart-body">

                            </div>
                            <div>
                                <h2>Total: <span class="cart-total">0</span>€</h2>
                                <button class="buyButton"><a href="/cart">Comprar</a></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="nav2">
        <nav>
            <div class="btn-group">
                <!--button type="button" class="btn btn-danger">Colecciones</button-->
                <a href="/collections" data-collections>Colecciones</a>
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
                    <li><a class="dropdown-item" href="#">Productos generales</a></li>
                </ul>
            </div>

            <div class="btn-group">
                <!--button type="button" class="btn btn-danger">Accesorios</button-->
                <a href="/accessories">Accesorios</a>
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

            <div class="btn-group">
                <!--button type="button" class="btn btn-danger">Eventos</button-->
                <a href="/calendar">Eventos</a>
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

            <div class="btn-group">
                <!--button type="button" class="btn btn-danger">Magic The Gathering</button-->
                <a href="mtg">Magic The Gathering</a>
                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                    data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="visually-hidden">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#" data-collections>Colecciones</a></li>
                    <li><a class="dropdown-item" href="#">Accesorios</a></li>
                    <li><a class="dropdown-item" href="#">Productos sueltos</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" href="#">Con Descuento</a></li>
                </ul>
            </div>

            <div class="btn-group">
                <!--button type="button" class="btn btn-danger">Yu-Gi-Oh!</button-->
                <a href="ygo">Yu-Gi-Oh!</a>
                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                    data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="visually-hidden">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#" data-collections>Colecciones</a></li>
                    <li><a class="dropdown-item" href="#">Accesorios</a></li>
                    <li><a class="dropdown-item" href="#">Productos sueltos</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" href="#">Con Descuento</a></li>
                </ul>
            </div>

            <div class="btn-group">
                <!--button type="button" class="btn btn-danger">Lorcana</button-->
                <a href="lor">Lorcana</a>
                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                    data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="visually-hidden">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#" data-collections>Colecciones</a></li>
                    <li><a class="dropdown-item" href="#">Accesorios</a></li>
                    <li><a class="dropdown-item" href="#">Productos sueltos</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" href="#">Con Descuento</a></li>
                </ul>
            </div>

            <div class="btn-group">
                <!--button type="button" class="btn btn-danger">Pokémon</button-->
                <a href="pok">Pokémon</a>
                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                    data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="visually-hidden">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#" data-collections>Colecciones</a></li>
                    <li><a class="dropdown-item" href="#">Accesorios</a></li>
                    <li><a class="dropdown-item" href="#">Productos sueltos</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" href="#">Con Descuento</a></li>
                </ul>
            </div>

            <div class="btn-group">
                <!--button type="button" class="btn btn-danger">One Piece TCG</button-->
                <a href="op">One Piece TCG</a>
                <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                    data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="visually-hidden">Toggle Dropdown</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#" data-collections>Colecciones</a></li>
                    <li><a class="dropdown-item" href="#">Accesorios</a></li>
                    <li><a class="dropdown-item" href="#">Productos sueltos</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" href="#">Con Descuento</a></li>
                </ul>
            </div>

        </nav>
    </div>
</header>