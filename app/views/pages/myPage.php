<div id="mypage">
    <main>
        <p>Bienvenido,<?= $_SESSION['name'] ?>!</p>
        <img src="<?= $_SESSION['profile'] ?>" alt="">
        <button class="edit">Edit Profile</button>
        <form class="hidden edit-form" action="/edit-account" method="post"  enctype="multipart/form-data">
            <label for="name">Nuevo nombre de usuario:</label>
            <input type="text" id="username" name="username" placeholder="Nombre completo" required>
            <label for="email">Nuevo correo electrónico:</label>
            <input type="email" id="email" name="email" placeholder="Correo electrónico" required autocomplete="email">
            <label for="password">Nueva contraseña:</label>
            <input type="password" id="password" name="password" placeholder="Contraseña" required
                autocomplete="new-password">
            <label for="confirmPassword">Confirmar nueva contraseña:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirmar contraseña"
                required autocomplete="new-password">
            <label for="phone">Nuevo número de teléfono:</label>
            <input type="tel" name="phone"
            required>
            <label for="image-url">Sube la imagen de perfil</label>
            <input type="file" name="image-url">
            <button type="submit">Actualizar</button>
        </form>
        <form id="botones">
            <button type="submit" formaction="/logout">Cerrar sesión</button>
            <button type="submit" formaction="/delete-account">Eliminar mi cuenta</button>
        </form>
    </main>
</div>