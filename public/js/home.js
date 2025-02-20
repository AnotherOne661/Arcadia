// Funcion para actualizar los estilos de los productos dependiendo del juego al que pertenezcan, cambiando su fuente a
// la adecuada
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


function main() {
  updateSetStyle();
}

main();
