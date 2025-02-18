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

function hideCart() {
  const menuHeader = document.querySelector(".menuTitle");
  const cartContainer = document.querySelector(".cart");
  const menuContainer = document.querySelector(".menu");
  menuHeader.innerText = "Menú";
  menuContainer.classList.remove("hidden");
  cartContainer.classList.add("hidden");
}

function hideMenu() {
  const menuHeader = document.querySelector(".menuTitle");
  const cartContainer = document.querySelector(".cart");
  const menuContainer = document.querySelector(".menu");

  menuHeader.innerText = "Carrito";
  menuContainer.classList.add("hidden");
  cartContainer.classList.remove("hidden");

  populateCart();
}

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

function removeFromCart(codExpansion, nombreProducto) {
  // Retrieve the cart from localStorage
  let cart = getLocalStorageCart();

  // Find the index of the item to remove
  const index = cart.findIndex(
    (item) =>
      item.codExpansion === codExpansion &&
      item.nombreProducto === nombreProducto
  );

  // Remove the item if it exists
  if (index >= 0) {
    cart.splice(index, 1); // Remove the item from the cart array

    // Update the cart in localStorage
    updateLocalStorageCart(cart);

    // Update the UI
    populateCart();
    updateCartPrice();
  } else {
    console.error("No se encontró el producto en el carrito");
  }
}

function populateCart() {
  // Retrieve the current cart from localStorage
  const cart = getLocalStorageCart();

  // Get all elements with the class "cart-body"
  const cartBodies = document.querySelectorAll(".cart-body");

  // Generate the cart HTML content
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

  // Update all cart-body elements
  cartBodies.forEach((cartBody) => {
    cartBody.innerHTML = cartHTML;
  });

  // Add event listeners for quantity changes
  document.querySelectorAll(".cart-input").forEach((input) => {
    input.addEventListener("change", updateCartQuantity);
  });

  // Update the total price
  updateCartPrice();
}
function updateCartQuantity(event) {
  const input = event.target;
  const index = parseInt(input.getAttribute("data-index"), 10); // Get the product index
  const newAmount = parseInt(input.value, 10); // Get the new quantity

  if (isNaN(newAmount) || newAmount <= 0) {
    alert("Por favor, ingresa una cantidad válida.");
    input.value = getLocalStorageCart()[index].amount; // Reset to previous value
    return;
  }

  // Retrieve the cart from localStorage
  let cart = getLocalStorageCart();

  // Update the quantity and total price
  cart[index].amount = newAmount;
  cart[index].total = cart[index].productPrice * newAmount;

  // Update localStorage with the modified cart
  updateLocalStorageCart(cart);

  // Update the UI
  populateCart();
}

function updateCartPrice() {
  let total = 0;

  // Calculate the total price
  const cart = getLocalStorageCart();
  cart.forEach((item) => {
    total += item.total;
  });

  // Update all elements displaying the total price
  document.querySelectorAll(".cart-total").forEach((totalElement) => {
    totalElement.textContent = total.toFixed(2);
  });
}
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
      console.warn("No hidden field found for product:", product);
    }
  });
}
window.onload = function () {
  getYear();
  initializeClickableImages();
  buyButton();
  updateSetStyle();
};
