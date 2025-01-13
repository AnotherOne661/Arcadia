const c_year = new Date().getFullYear();

function getYear() {
  const spanYear = document.querySelector("[data-curdate]");
  spanYear.innerHTML = c_year;
}

function handleImageClick(event) {
  // Obtener la URL de la imagen clickeada (está en el html element)
  const url = event.target.getAttribute("data-url");
  if (url) {
    window.location.href = url;
  }
}
function initializeClickableImages() {
  // Recorre las imágenes y les agrega a cada una un evento de click que llama a la función handleImageClick
  document.querySelectorAll(".clickableimage").forEach((image) => {
    image.addEventListener("click", handleImageClick);
  });
}

function hideCart(){
  const menuHeader = document.querySelector(".menuTitle");
  const cartContainer = document.querySelector('.cart');
  const menuContainer = document.querySelector('.menu');
  menuHeader.innerText = "Menú";
  menuContainer.classList.remove('hidden');
  cartContainer.classList.add('hidden');

}

function hideMenu(){
  const menuHeader = document.querySelector(".menuTitle");
  const cartContainer = document.querySelector('.cart');
  const menuContainer = document.querySelector('.menu');

  menuHeader.innerText = "Carrito";
  menuContainer.classList.add('hidden');
  cartContainer.classList.remove('hidden');

  populateCart();
}

function buyButton() {
  const buyButtons = document.querySelectorAll(".productButton");
  if (!buyButtons) {
    return;
  }

  buyButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const productBox = button.closest(".product"); // Parent container
      const codExpansionInput = productBox.querySelector(".idExpansion");
      const productName = productBox.querySelector(".productTitle");
      const productPrice = productBox.querySelector(".productPrice");
      const temp = productPrice.textContent;
      const productQuantity = productBox.querySelector(".productQuantity");

      if (codExpansionInput && productName) {
        const codExpansion = codExpansionInput.value;
        const nombreProducto = productName.textContent.trim();
        const amount = productQuantity.value;

        const productPriceReal = temp.split("€");
        const productPrice = parseFloat(productPriceReal[0]);
        const total = productPrice * amount;

        // Retrieve the current cart from localStorage
        let cart = getLocalStorageCart();

        // Add the new product to the cart
        cart.push({
          codExpansion,
          nombreProducto,
          amount,
          total,
          productPrice,
        });

        // Update localStorage with the new cart
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
        console.warn("Product details not found for button:", button);
      }
    });
  });
}

function updateLocalStorageCart(cart) {
  localStorage.setItem("cart", JSON.stringify(cart));
}

function getLocalStorageCart() {
  const cart = localStorage.getItem("cart");
  return cart ? JSON.parse(cart) : []; // Return parsed cart or empty array if it doesn't exist
}

function removeFromCart(codigoExpansion, nombreProducto) {
  const index = cart.findIndex(
    (item) =>
      item.codExpansion === codigoExpansion &&
      item.nombreProducto === nombreProducto
  );
  if (index >= 0) {
    cart.splice(index, 1);
    localStorage.setItem("cart", JSON.stringify(cart));
    populateCart();
  } else {
    console.error("No se encontró el producto en el carrito");
  }
}

function populateCart() {
  let cartHTML = "";
  cart.forEach((item, index) => {
    cartHTML += `
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
      <button onclick="removeFromCart('${item.codExpansion}', '${
      item.nombreProducto
    }')">Eliminar</button>
    </div>
    `;
  });

  document.querySelector(".cart-body").innerHTML = cartHTML;

  // Agregar eventos de cambio a los inputs de cantidad
  document.querySelectorAll(".cart-input").forEach((input) => {
    input.addEventListener("change", updateCartQuantity);
  });

  updateCartPrice();
}
function updateCartQuantity(event) {
  const input = event.target;
  const index = parseInt(input.getAttribute("data-index"), 10); // Índice del producto en el carrito
  const newAmount = parseInt(input.value, 10); // Nueva cantidad ingresada por el usuario

  if (isNaN(newAmount) || newAmount <= 0) {
    alert("Por favor, ingresa una cantidad válida.");
    input.value = cart[index].amount; // Restablecer el valor anterior
    return;
  }

  // Actualizar la cantidad y el total en el carrito
  cart[index].amount = newAmount;
  cart[index].total = cart[index].productPrice * newAmount;

  // Actualizar el carrito en localStorage
  updateLocalStorageCart(cart);

  // Actualizar la interfaz de usuario
  populateCart();
  updateCartPrice();
}

function updateCartPrice() {
  let total = 0;
  cart.forEach((item) => {
    total += item.total;
  });
  document.querySelector(".cart-total").innerHTML = total;
}
window.onload = function () {
  getYear();
  initializeClickableImages();
  buyButton();
};
