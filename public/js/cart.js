function isValidAddress(address) {
  return address.length > 15;
}

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

function isValidPostalCode(postalCode) {
  const regex = /^(?:0[1-9]\d{3}|[1-4]\d{4}|5[0-2]\d{3})$/;
  return regex.test(postalCode);
}

function main() {
  populateCart();

  const stripe = Stripe("pk_test_51Qp4LaPteoa4CQqLbmXU629PimI1Z1omu3gWI8tjDN9831EPOrHDvcfLCt1OdNEvWsEsobW5VvGVulQJ0DS5AT4F00WLcRC4bG");
  const elements = stripe.elements();
  const cardElement = elements.create("card");
  cardElement.mount('#card-element');

  cardElement.on('change', function(event) {
    const displayError = document.getElementById('card-errors');
    displayError.textContent = event.error ? event.error.message : '';
  });

  const form = document.querySelector(".details");
  if (form) {
    form.addEventListener("submit", async (event) => {
      event.preventDefault();

      const name = document.getElementById('name').value;
      const community = document.getElementById('community').value;
      const localidad = document.getElementById('localidad').value;
      const address = document.getElementById('address').value;
      const postalCode = document.getElementById('postalCode').value;

      if (!isValidAddress(address) || !isValidCommunity(community) || !isValidPostalCode(postalCode)) {
        alert("Por favor, verifica que los campos de dirección sean válidos.");
        return;
      }

      const { paymentMethod, error } = await stripe.createPaymentMethod({
        type: 'card',
        card: cardElement,
        billing_details: {
          name: name,
          address: {
            line1: address,
            city: localidad,
            postal_code: postalCode,
            state: community,
          },
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

main();

function processPayment(paymentMethodId) {
  fetch('/process_payment.php', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ payment_method_id: paymentMethodId })
  })
  .then(response => response.json())
  .then(data => {
    if (data.success) {
      alert('Pago realizado con éxito!');
      // Optionally clear the cart or redirect the user
    } else {
      document.getElementById('card-errors').textContent = data.error;
    }
  })
  .catch(error => console.error('Error:', error));
}
/*
document.addEventListener("DOMContentLoaded", () => {
  const stripe = Stripe("pk_test_51Qp4LaPteoa4CQqLbmXU629PimI1Z1omu3gWI8tjDN9831EPOrHDvcfLCt1OdNEvWsEsobW5VvGVulQJ0DS5AT4F00WLcRC4bG");
  const elements = stripe.elements();
  const cardElement = elements.create("card");
  cardElement.mount('#card-element');

  cardElement.on('change', function(event) {
    const displayError = document.getElementById('card-errors');
    displayError.textContent = event.error ? event.error.message : '';
  });

  const form = document.querySelector(".details");
  form.addEventListener("submit", async (event) => {
    event.preventDefault();

    const name = document.getElementById('name').value;
    const community = document.getElementById('community').value;
    const localidad = document.getElementById('localidad').value;
    const address = document.getElementById('address').value;
    const postalCode = document.getElementById('postalCode').value;

    if (!isValidAddress(address) || !isValidCommunity(community) || !isValidPostalCode(postalCode)) {
      alert("Por favor, verifica que los campos de dirección sean válidos.");
      return;
    }

    const { paymentMethod, error } = await stripe.createPaymentMethod({
      type: 'card',
      card: cardElement,
      billing_details: {
        name: name,
        address: {
          line1: address,
          city: localidad,
          postal_code: postalCode,
          state: community,
        },
      },
    });

    if (error) {
      document.getElementById('card-errors').textContent = error.message;
    } else {
      processPayment(paymentMethod.id);
    }
  });

  function processPayment(paymentMethodId) {
    fetch('/process_payment.php', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ payment_method_id: paymentMethodId })
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('Pago realizado con éxito!');
        // Optionally clear the cart or redirect the user
      } else {
        document.getElementById('card-errors').textContent = data.error;
      }
    })
    .catch(error => console.error('Error:', error));
  }

  // Input validation functions
  function isValidAddress(address) {
    return address.length > 15;
  }

  function isValidCommunity(community) {
    const communityLower = community.toLowerCase();
    const communities = ["madrid", "comunidad de madrid", "andalucía", "andalucia", "aragón", "aragon", "canarias", "islas canarias", "cantabria", "castilla-la mancha", "castilla la mancha", "castilla y león", "castilla y leon", "cataluña", "catalunya", "comunidad foral de navarra", "navarra", "comunitat valenciana", "comunidad valenciana", "extremadura", "galicia", "illes balears", "islas baleares", "la rioja", "país vasco", "pais vasco", "euskadi", "principado de asturias", "asturias", "región de murcia", "region de murcia", "murcia"];
    return communities.includes(communityLower);
  }

  function isValidPostalCode(postalCode) {
    const regex = /^(?:0[1-9]\d{3}|[1-4]\d{4}|5[0-2]\d{3})$/;
    return regex.test(postalCode);
  }
});
*/