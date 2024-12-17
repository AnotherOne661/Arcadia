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
function expansionEvent() {
  const expansions = document.querySelectorAll(".expansion");

  expansions.forEach((expansion) => {
    // Find the sibling input with class 'idExpansion' for each .expansion
    const idExpansionInput = expansion.querySelector(".idExpansion");

    if (idExpansionInput) {
      const codExpansion = idExpansionInput.value;

      // Add the click event listener to redirect
      expansion.addEventListener("click", () => {
        if (codExpansion) {
          window.location.href = `/${codExpansion}`;
        } else {
          console.warn("No codExpansion value found for expansion:", expansion);
        }
      });
    } else {
      console.warn("No idExpansion input found for expansion:", expansion);
    }
  });
}
function updateLocalStorageCart(cart) {
  localStorage.setItem("cart", JSON.stringify(cart));
}

function getLocalStorageCart() {
  const cart = localStorage.getItem("cart");
  return cart ? JSON.parse(cart) : []; // Return parsed cart or empty array if it doesn't exist
}

function buyButton() {
  const buyButtons = document.querySelectorAll(".productButton");

  buyButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const productBox = button.closest(".product"); // Parent container
      const codExpansionInput = productBox.querySelector(".idExpansion");
      const productName = productBox.querySelector(".productTitle");

      if (codExpansionInput && productName) {
        const codExpansion = codExpansionInput.value;
        const nombreProducto = productName.textContent.trim();

        // Retrieve the current cart from localStorage
        let cart = getLocalStorageCart();

        // Add the new product to the cart
        cart.push({ codExpansion, nombreProducto });

        // Update localStorage with the new cart
        updateLocalStorageCart(cart);

        alert(`Added "${nombreProducto}" to the cart!`);
      } else {
        console.warn("Product details not found for button:", button);
      }
    });
  });
}

function main() {
  updateSetStyle();
  expansionEvent();
  buyButton();
}

main();
