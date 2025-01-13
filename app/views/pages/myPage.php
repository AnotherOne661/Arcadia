<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Page</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <header>
        <nav>
            <ul>
                <li><a href="/home">Home</a></li>
                <li><a class="logout" href="/logout">Logout</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <p>Bienvenido,<?= $_SESSION['name'] ?>!</p>
        <button>View Profile</button>
        <button onclick="showEdit">Edit Profile</button>
        <form class="hidden" action="/edit-account" method="post">
            <label for="name">Nuevo nombre de usuario:</label>
            <input type="text" id="username" name="username" placeholder="Nombre completo" required>
            <label for="email">Nuevo correo electrónico:</label>
            <input type="email" id="email" name="email" placeholder="Correo electrónico" required>
            <label for="password">Nueva contraseña:</label>
            <input type="password" id="password" name="password" placeholder="Contraseña" required>
            <label for="confirmPassword">Confirmar nueva contraseña:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirmar contraseña" required>
            <label for="phone">Nuevo número de teléfono:</label>
            <input type="tel" required>
            <button type="submit">Actualizar</button>
        </form>
        <form action="/logout">
            <button type="submit">Cerrar sesión</button>
        </form>
        <form action="/delete-account">
            <button type="submit">Eliminar mi cuenta</button>
        </form>
    </main>
    <footer>
        &copy; 2023 Your Company
    </footer>
</body>

</html>