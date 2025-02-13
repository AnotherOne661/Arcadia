
const stripe = Stripe("pk_test_51Qp4LaPteoa4CQqLbmXU629PimI1Z1omu3gWI8tjDN9831EPOrHDvcfLCt1OdNEvWsEsobW5VvGVulQJ0DS5AT4F00WLcRC4bG");
var cardElement;

function isValidCommunity(community) {
  const communityLower = community.toLowerCase();
  const communities = [
    "madrid", "comunidad de madrid", "andalucía", "andalucia", "aragón", "aragon",
    "canarias", "islas canarias", "cantabria", "castilla-la mancha", "castilla la mancha",
    "castilla y león", "castilla y leon", "cataluña", "catalunya", "comunidad foral de navarra",
    "navarra", "comunitat valenciana", "comunidad valenciana", "extremadura", "galicia",
    "illes balears", "islas baleares", "la rioja", "país vasco", "pais vasco", "euskadi",
    "principado de asturias", "asturias", "región de murcia", "region de murcia", "murcia"
  ];
  return communities.includes(communityLower);
}
function isValidAddress(address) {
  return address.length > 15;
}

function isValidPostalCode(postalCode) {
  const regex = /^(?:0[1-9]\d{3}|[1-4]\d{4}|5[0-2]\d{3})$/;
  return regex.test(postalCode);
}

function main() {
  populateCart();

  if (document.getElementById("card-element") !== null) {
    const elements = stripe.elements();
    cardElement = elements.create("card"); // Assign to the global variable
    cardElement.mount('#card-element');
    cardElement.on('change', function(event) {
      const displayError = document.getElementById('card-errors');
      displayError.textContent = event.error ? event.error.message : '';
    });
  }

  const buyNow = document.querySelector(".buyNow");
  buyNow.classList.add("hidden");   
  if (!localStorage.getItem("cart")) {
    buyNow.classList.remove("hidden");   
  }

  const total = document.querySelector(".session");
  total.classList.add("hidden");
  if (localStorage.getItem("cart")) {
    total.classList.remove("hidden");
  }

  const vaciarCarrito = document.querySelector(".clear-cart");
  vaciarCarrito.classList.add("hidden");
  if (localStorage.getItem("cart")) {
    vaciarCarrito.classList.remove("hidden");
    vaciarCarrito.addEventListener("click", () => {
      Swal.fire({
        title: '¿Estás seguro de que quieres vaciar el carrito?',
        showDenyButton: true,
        confirmButtonText: `Sí`,
        denyButtonText: `No`,
        denyIcon: 'warning',
        confirmButtonColor: '#eec643',
        denyButtonColor: '#a41623',
      }).then((result) => {
        if (result.isConfirmed) {
          localStorage.removeItem("cart");
          window.location.reload();
        }
      });
    });
  }

  const form = document.querySelector(".details");
  if (form) {
    form.addEventListener("submit", async (event) => {
      event.preventDefault();

      const community = document.getElementById('community').value;
      const localidad = document.getElementById('localidad').value;
      const address = document.getElementById('address').value;
      const postalCode = document.getElementById('postalCode').value;

      if (!isValidAddress(address)) {
        Swal.fire({ icon: 'error', title: 'Oops...', text: 'Por favor, introduce una dirección válida.' });
        return;
      }
      
      if (!isValidCommunity(community)) {
        Swal.fire({ icon: 'error', title: 'Oops...', text: 'Por favor, introduce una comunidad válida.' });
        return;
      }
      
      if (!isValidPostalCode(postalCode)) {
        Swal.fire({ icon: 'error', title: 'Oops...', text: 'Por favor, introduce un código postal válido.' });
        return;
      }

      if (!cardElement) {
        Swal.fire({ icon: 'error', title: 'Oops...', text: 'Error al procesar el pago. Inténtalo de nuevo.' });
        return;
      }

      const { paymentMethod, error } = await stripe.createPaymentMethod({
        type: 'card',
        card: cardElement, // Now it is properly accessible
        billing_details: {
          name: name,
          address: { line1: address, city: localidad, postal_code: postalCode, state: community },
        },
      });

      if (error) {
        document.getElementById('card-errors').textContent = error.message;
      } else {
        processPayment(paymentMethod.id);
      }
    });
  }
}




function processPayment() {
  // Get the form values

  const community = document.getElementById('community').value;
  const localidad = document.getElementById('localidad').value;
  const address = document.getElementById('address').value;
  const postalCode = document.getElementById('postalCode').value;


  // Validate the inputs
  if ( community && localidad && address && postalCode) {
    // Trigger SweetAlert2 popup
    Swal.fire({
      title: '¡Pago exitoso!',
      text: 'Tu pedido ha sido procesado correctamente.',
      icon: 'success',
      confirmButtonText: 'Aceptar'
    }).then((result) => {
      if (result.isConfirmed) {
        // Redirect after closing the popup
        localStorage.removeItem("cart");
        window.location.href = 'mypage';  // Change the URL to wherever you want to redirect
      }
    });
  } else {
    // Trigger error popup if fields are incomplete
    Swal.fire({
      title: 'Campos incompletos',
      text: 'Por favor, completa todos los campos de pago.',
      icon: 'error',
      confirmButtonText: 'Entendido'
    });
  }
}
main();
