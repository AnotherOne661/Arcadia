<!--
<script defer src="/js/fetchLanding.js"></script>
-->

<body>
    <!-- Primero el header -->
    <header>
        <div id="header-spacer"></div>
        <div id="logocont">
            <a href="home"><img src="assets/images/altern.png"></a>
        </div>
        <div id="socialmedia">
            <span class="icoholder"><img src="/assets/images/icons/facebook.svg"></span>
            <span class="icoholder"><img src="/assets/images/icons/instagram.svg"></span>
            <span class="icoholder"><img src="/assets/images/icons/x-logo.svg"></span>
            <span class="icoholder"><img src="/assets/images/icons/discord.svg"></span>
        </div>
    </header>

    <main>


        <!-- Animación de imágenes -->
        <section class="set-animation">
            <img class="clickableimage" src="\assets\images\product\MTG\sets\dsk.jpg" alt="" data-url="/">
            <img class="clickableimage" src="/assets\images\product\OP\sets\OP-09.jpg" alt="" data-url="/">
            <img class="clickableimage" src="\assets\images\product\POk\sets\brnsprk.webp" alt="" data-url="/">
            <img class="clickableimage" src="\assets\images\product\YGO\sets\25.jpg" alt="" data-url="/">
            <img class="clickableimage" src="\assets\images\product\LOR\sets\azs.webp" alt="" data-url="/">
        </section>



        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
                    aria-label="Slide 4"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"
                    aria-label="Slide 5"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/assets/images/product/MTG/sets/dsk.jpg" class="slider_image" alt="Slide 1" />
                </div>
                <div class="carousel-item">
                    <img src="/assets/images/product/YGO/sets/25.jpg" class="slider_image" alt="Slide 2" />
                </div>
                <div class="carousel-item">
                    <img src="/assets/images/product/POK/sets/brnsprk.webp" class="slider_image" alt="Slide 3" />
                </div>
                <div class="carousel-item">
                    <img src="/assets/images/product/LOR/sets/azs.webp" class="slider_image" alt="Slide 3" />
                </div>
                <div class="carousel-item">
                    <img src="/assets/images/product/OP/sets/OP-09.webp" class="slider_image" alt="Slide 3" />
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>


        <!-- Productos del JSON -->
        <div class="products">
        </div>


        <!-- Newsletter -->

        <div class="newsletter">
            <form id="newsletterForm" method="POST">
                <label for="email">¡SUSCRÍBETE A NUESTRA NEWSLETTER!</label>
                <input type="email" id="email" name="email" required>
                <button type="submit">ENVIAR</button>
            </form>
        </div>



    </main>
    <!-- Footer Section -->
    <footer>
        <!-- Learn to Play -->
        <div class="learn">
            <h3>Aprende a jugar</h3>
            <a href="/learn-ygo" class="learnbutton">
                <div class="learnbutton">
                    <p>Yu Gi Oh!</p>
                    <img src="../assets/images/struc/land_footer/dark-magician.png" alt=""> <!-- Logo de Yu Gi Oh! -->
                </div>
            </a>

            <a href="/learn-lor" class="learnbutton">
                <div class="learnbutton">
                    <p>Lorcana</p>
                    <img src="../assets/images/struc/land_footer/lorcana.webp" alt=""> <!-- Logo de Lorcana -->
                </div>
            </a>

            <a href="/learn-mtg" class="learnbutton">
                <div class="learnbutton">
                    <p>Magic</p>
                    <img src="../assets/images/struc/land_footer/mtg.webp" alt=""> <!-- Logo de Magic: The Gathering -->
                </div>
            </a>

            <a href="/learn-pok" class="learnbutton">
                <div class="learnbutton">
                    <p>Pokémon</p>
                    <img src="../assets/images/struc/land_footer/pokemon.webp" alt=""> <!-- Logo de Pokémon -->
                </div>
            </a>
        </div>

        <div class="footer-icon">
            <div class="logofooter">
                <a href="/home"><img src="assets/images/altern.png" alt=""></a> <!-- Logo del footer -->
            </div>
        </div>
        <div class="social-media-footer">
            <h3>Síguenos</h3>
            <span class="icoholder"><img src="/assets/images/icons/facebook.svg"></span>
            <span class="icoholder"><img src="/assets/images/icons/instagram.svg"></span>
            <span class="icoholder"><img src="/assets/images/icons/x-logo.svg"></span>
            <span class="icoholder"><img src="/assets/images/icons/discord.svg"></span>
        </div>
        <!-- Contact Information -->
        <div class="contact">
            <h3>Ven a jugar</h3>
            <div class="footer-contact">
                <p><span><img src="/assets/images/icons/mail.svg" alt=""></span>placeholder@holder.com
                    <!-- Placeholder email  -->
                </p>
                <p><span><img src="/assets/images/icons/phone.svg" alt=""></span>916 40 46 96 <!-- Phone  -->
                </p>
                <p><span><img src="/assets/images/icons/location-a.svg"></span>Calle Mirador de Montepinar, 1 - 28015,
                    Madrid<!-- Address -->
                </p>
                <p><span><img src="/assets/images/icons/time.svg"></span>De lúnes a viernes ; 11:30 - 15:00 &amp; 17:00
                    - 19:00<!-- Opening hours -->
                </p>
            </div>
        </div>
    </footer>

</body>