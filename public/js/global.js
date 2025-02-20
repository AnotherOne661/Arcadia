const c_year = new Date().getFullYear();

// Función para obtener el año actual y actualizar el elemento correspondiente
function getYear() {
  const spanYear = document.querySelector("[data-curdate]");
  spanYear.innerHTML = c_year;
}

// Función para manejar el clic en una imagen
function handleImageClick(event) {
  // Obtener la URL de la imagen clickeada (está en el html element)
  const url = event.target.getAttribute("data-url");
  if (url) {
    window.location.href = url;
  }
}

// Función para inicializar las imágenes clicables
function initializeClickableImages() {
  // Recorre las imágenes y les agrega a cada una un evento de click que llama a la función handleImageClick
  document.querySelectorAll(".clickableimage").forEach((image) => {
    image.addEventListener("click", handleImageClick);
  });
}

// Función para ocultar el carrito y mostrar el menú
function hideCart() {
  const menuHeader = document.querySelector(".menuTitle");
  const cartContainer = document.querySelector(".cart");
  const menuContainer = document.querySelector(".menu");
  menuHeader.innerText = "Menú";
  menuContainer.classList.remove("hidden");
  cartContainer.classList.add("hidden");
}

// Función para ocultar el menú y mostrar el carrito
function hideMenu() {
  const menuHeader = document.querySelector(".menuTitle");
  const cartContainer = document.querySelector(".cart");
  const menuContainer = document.querySelector(".menu");

  menuHeader.innerText = "Carrito";
  menuContainer.classList.add("hidden");
  cartContainer.classList.remove("hidden");

  populateCart();
}

// Función para manejar el botón de compra
function buyButton() {
  const buyButtons = document.querySelectorAll(".productButton");
  if (!buyButtons) {
    return;
  }

  buyButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const productBox = button.closest(".product"); 
      const codExpansionInput = productBox.querySelector(".idExpansion");
      const productName = productBox.querySelector(".productTitle");
      const productPrice = productBox.querySelector(".productPrice");
      const temp = productPrice.textContent;
      const productQuantity = productBox.querySelector(".productQuantity");

      if (codExpansionInput && productName) {
        const codExpansion = codExpansionInput.value;
        const nombreProducto = productName.textContent.trim();

        const amount = parseInt(productQuantity.value, 10);
        const productPriceReal = temp.split("€");
        const productPrice = parseFloat(productPriceReal[0]);
        const total = productPrice * amount;

        // Obtener el carrito actual de localStorage
        let cart = getLocalStorageCart();

        // Agregar el nuevo producto al carrito
        cart.push({
          codExpansion,
          nombreProducto,
          amount,
          total,
          productPrice,
        });

        // Actualizar localStorage con el nuevo carrito
        updateLocalStorageCart(cart);
        const Toast = Swal.mixin({
          toast: true,
          position: "top-end",
          showConfirmButton: false,
          timer: 1500,
          timerProgressBar: true,
          iconColor: "#eef0f2",
          color: "#141414",
          background: "#eec643",
          didOpen: (toast) => {
            toast.onmouseenter = Swal.stopTimer;
            toast.onmouseleave = Swal.resumeTimer;
          },
        });
        Toast.fire({
          icon: "success",
          title: "Se ha añadido al carrito",
          text: `${nombreProducto}`,
        });
      } else {
        console.warn("No se encontraron detalles del producto para el botón:", button);
      }
    });
  });
}

// Función para actualizar el carrito en localStorage
function updateLocalStorageCart(cart) {
  localStorage.setItem("cart", JSON.stringify(cart));
}

// Función para obtener el carrito de localStorage
function getLocalStorageCart() {
  const cart = localStorage.getItem("cart");
  return cart ? JSON.parse(cart) : []; // Devolver el carrito parseado o un array vacío si no existe
}

// Función para eliminar un producto del carrito
function removeFromCart(codExpansion, nombreProducto) {
  // Obtener el carrito de localStorage
  let cart = getLocalStorageCart();

  // Encontrar el índice del elemento a eliminar
  const index = cart.findIndex(
    (item) =>
      item.codExpansion === codExpansion &&
      item.nombreProducto === nombreProducto
  );

  // Eliminar el elemento si existe
  if (index >= 0) {
    cart.splice(index, 1); // Eliminar el elemento del array del carrito

    // Actualizar el carrito en localStorage
    updateLocalStorageCart(cart);

    // Actualizar la interfaz de usuario
    populateCart();
    updateCartPrice();
  } else {
    console.error("No se encontró el producto en el carrito");
  }
}

// Función para poblar el carrito con los productos de localStorage
function populateCart() {
  // Obtener el carrito actual de localStorage
  const cart = getLocalStorageCart();

  // Obtener todos los elementos con la clase "cart-body"
  const cartBodies = document.querySelectorAll(".cart-body");

  // Generar el contenido HTML del carrito
  const cartHTML = cart
    .map(
      (item, index) => `
      <div>
        <h4>${item.nombreProducto}</h4>
        <p>Precio: ${item.productPrice} €</p>
        <input 
          type="number" 
          value="${item.amount}" 
          class="cart-input" 
          data-index="${index}"
          min="1"
        >
        <p>Total: ${item.total.toFixed(2)} €</p>
        <button class="cart-button" onclick="removeFromCart('${
          item.codExpansion
        }', '${item.nombreProducto.replace(/'/g, "\\'")}')">Eliminar</button>
      </div>
    `
    )
    .join("");

  // Actualizar todos los elementos cart-body
  cartBodies.forEach((cartBody) => {
    cartBody.innerHTML = cartHTML;
  });

  // Agregar event listeners para cambios en la cantidad
  document.querySelectorAll(".cart-input").forEach((input) => {
    input.addEventListener("change", updateCartQuantity);
  });

  // Actualizar el precio total
  updateCartPrice();
}

// Función para actualizar la cantidad de productos en el carrito
function updateCartQuantity(event) {
  const input = event.target;
  const index = parseInt(input.getAttribute("data-index"), 10); // Obtener el índice del producto
  const newAmount = parseInt(input.value, 10); // Obtener la nueva cantidad

  if (isNaN(newAmount) || newAmount <= 0) {
    alert("Por favor, ingresa una cantidad válida.");
    input.value = getLocalStorageCart()[index].amount; // Restablecer al valor anterior
    return;
  }

  // Obtener el carrito de localStorage
  let cart = getLocalStorageCart();

  // Actualizar la cantidad y el precio total
  cart[index].amount = newAmount;
  cart[index].total = cart[index].productPrice * newAmount;

  // Actualizar localStorage con el carrito modificado
  updateLocalStorageCart(cart);

  // Actualizar la interfaz de usuario
  populateCart();
}

// Función para actualizar el precio total del carrito
function updateCartPrice() {
  let total = 0;

  // Calcular el precio total
  const cart = getLocalStorageCart();
  cart.forEach((item) => {
    total += item.total;
  });

  // Actualizar todos los elementos que muestran el precio total
  document.querySelectorAll(".cart-total").forEach((totalElement) => {
    totalElement.textContent = total.toFixed(2);
  });
}

// Función para manejar la compra
function buy() {
  const cart = getLocalStorageCart();
  if (cart.length === 0) {
    alert("No hay productos en el carrito");
    return;
  }
  const total = document.querySelector(".cart-total").textContent;
  const totalNumber = parseFloat(total);
  const totalString = totalNumber.toFixed(2);
}

// Función para actualizar el estilo del conjunto de productos
function updateSetStyle() {
  const products = document.querySelectorAll(".product");

  products.forEach((product) => {
    const productGame = product.querySelector(".idJuego");

    if (productGame) {
      const gameValue = productGame.value;

      switch (gameValue) {
        case "1":
          product.classList.add("MTG");
          break;
        case "2":
          product.classList.add("YGO");
          break;
        case "3":
          product.classList.add("POK");
          break;
        case "4":
          product.classList.add("LOR");
          break;
        case "5":
          product.classList.add("OP");
          break;
        default:
          product.classList.add("other");
          break;
      }
    } else {
      console.warn("No se encontró campo oculto para el producto:", product);
    }
  });
}

// Ejecutar las funciones al cargar la ventana
window.onload = function () {
  getYear();
  initializeClickableImages();
  buyButton();
  updateSetStyle();
};
