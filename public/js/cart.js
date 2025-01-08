const cart = getLocalStorageCart();

function getLocalStorageCart() {
  const cart = localStorage.getItem("cart");
  return cart ? JSON.parse(cart) : []; // Return parsed cart or empty array if it doesn't exist
}

function main() {
  populateCart();
  updateCartPrice();
  document
    .querySelector(".cart-input")
    .addEventListener("change", updateCartPrice);
  document.querySelector(".cart-form").addEventListener("submit", buy);
}
main();
function buy(event) {
  event.preventDefault();
  cart = [];
  updateLocalStorageCart(cart);
  populateCart();
  updateCartPrice();
  alert("Compra realizada con éxito");
}
