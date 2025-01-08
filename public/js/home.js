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

function main() {
  updateSetStyle();
  expansionEvent();
}

main();
