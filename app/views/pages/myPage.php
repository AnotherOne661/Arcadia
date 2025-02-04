<main>
    <div id="mypage">
        <div>
            <?php
            if (isset($_SESSION['signup_error_duplicate'])) {
                echo '<p class="success" style="text-aling:center;"> ' . $_SESSION['signup_error_duplicate'] . '</p>';
                unset($_SESSION['signup_error_duplicate']);
            } ?>
            </p>
            <p>Bienvenido,<?= $_SESSION['name'] ?>!</p>
            <img class="profile" src="<?= $_SESSION['profile-path'] ?>" alt="">
            <button class="edit">Edit Profile</button>
            <form class="hidden edit-form" action="/edit-account" method="post" enctype="multipart/form-data">
                <label for="name">Nuevo nombre de usuario:</label>
                <input type="text" id="username" name="username" placeholder="Nombre completo" required>
                <label for="email">Nuevo correo electrónico:</label>
                <input type="email" id="email" name="email" placeholder="Correo electrónico" required
                    autocomplete="email">
                <label for="password">Nueva contraseña:</label>
                <input type="password" id="password" name="password" placeholder="Contraseña" required
                    autocomplete="new-password">
                <label for="confirmPassword">Confirmar nueva contraseña:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirmar contraseña"
                    required autocomplete="new-password">
                <label for="phone">Nuevo número de teléfono:</label>
                <input type="tel" name="phone" required>
                <label for="imageurl">Sube la imagen de perfil</label>
                <input type="file" name="imageurl">
                <button type="submit">Actualizar</button>
            </form>
            <form id="botones">
                <button type="submit" formaction="/logout">Cerrar sesión</button>
                <button type="submit" formaction="/delete-account">Eliminar mi cuenta</button>
            </form>
        </div>

    </div>
</main>