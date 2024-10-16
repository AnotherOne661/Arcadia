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
                    <div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="nav2">
        <nav>
            <a href="index.php">Accesorios</a>
            <a href="about.php">Eventos</a>
            <a href="products.php">Magic The Gathering</a>
            <a href="subpages/contact.php">Yu-Gi-Oh</a>
            <a href="cart.php">Lorcana</a>
            <a href="login.php">One Piece TCG</a>
            <a href="login.php">Pokémon</a>
            <a href="calendar.php">Calendario</a>
        </nav>
    </div>
</header>