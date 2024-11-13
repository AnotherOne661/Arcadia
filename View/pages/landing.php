<script defer src="/js/fetchLanding.js"></script>


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
            <img class="clickableimage" src="/assets\images\product\OP\sets\OP-09.webp" alt="" data-url="/">
            <img class="clickableimage" src="\assets\images\product\POk\sets\brnsprk.webp" alt="" data-url="/">
            <img class="clickableimage" src="\assets\images\product\YGO\sets\25.jpg" alt="" data-url="/">
            <img class="clickableimage" src="\assets\images\product\LOR\sets\azs.webp" alt="" data-url="/">
        </section>





        <!-- Productos del JSON -->
        <div class="products">
        </div>


        <!-- Newsletter -->

        <div class="newsletter">
            <form action="">
                <label for="email">¡SUSCRÍBETE A NUESTRA NEWSLETTER!</label>
                <input type="email" id="email" name="email">
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

        <div>
            <div class="logofooter">
                <a href="/home"><img src="assets/images/altern.png" alt=""></a> <!-- Logo del footer -->
            </div>
        </div>
        <!-- Contact Information -->
        <div id="contact">
            <h3>Ven a jugar</h3>
            <div>
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