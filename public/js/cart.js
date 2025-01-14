/*const cart = getLocalStorageCart();

function getLocalStorageCart() {
  const cart = localStorage.getItem("cart");
  return cart ? JSON.parse(cart) : []; // Return parsed cart or empty array if it doesn't exist
}
*/
function main() {
  populateCart();
}
main();
