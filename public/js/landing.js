function updatePrice() {
    // Select all old and new prices
    const oldPrices = document.querySelectorAll('.old-product-price');
    const newPrices = document.querySelectorAll('.product-price');

    // Check if the count of oldPrices and newPrices matches
    if (oldPrices.length !== newPrices.length) {
        console.error('Mismatch in number of old and new price elements!');
        return;
    }

    oldPrices.forEach((oldPrecio, index) => {
        // Parse the old price as a number
        const oldPriceValue = parseFloat(oldPrecio.textContent || oldPrecio.value);

        // Calculate the new price (25% of the old price)
        const newPriceValue = (oldPriceValue * 0.75).toFixed(2);

        // Update the corresponding new price element
        if (newPrices[index]) {
            if (newPrices[index].tagName === 'INPUT') {
                newPrices[index].value = newPriceValue; // For input fields
            } else {
                newPrices[index].textContent = `${newPriceValue}€`; // For spans or other elements
            }
        }
    });
}

function updateSetStyle() {
    // Select all products
    const products = document.querySelectorAll('.product');

    products.forEach(product => {
        // Find the hidden field for the product's game ID
        const productGame = product.querySelector('.hidden');

        if (productGame) {
            const gameValue = productGame.value;

            // Add the appropriate class based on the game ID
            switch (gameValue) {
                case '1':
                    product.classList.add('MTG');
                    break;
                case '2':
                    product.classList.add('YGO');
                    break;
                case '3':
                    product.classList.add('POK');
                    break;
                case '4':
                    product.classList.add('LOR');
                    break;
                case '5':
                    product.classList.add('OP');
                    break;
                default:
                    product.classList.add('other');
                    break;
            }
        } else {
            console.warn('No hidden field found for product:', product);
        }
    });
}

function initializeClickableImages() {
    // Select all clickable images
    const clickableImages = document.querySelectorAll('.clickableimage');

    // Add event listeners to each clickable image
    clickableImages.forEach(image => {
        // Add a click event listener
        image.addEventListener('click', () => {
            // Get the data-url attribute value
            const url = image.getAttribute('data-url');

            // Check if the URL exists and navigate to it
            if (url) {
                window.location.href = url;
            } else {
                console.warn('No data-url found for image:', image);
            }
        });
    });
}


// Run the functions on window load
window.onload = () => {
    updatePrice();
    updateSetStyle();
    initializeClickableImages();
};
