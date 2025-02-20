function updatePrice() {
    // Seleccionar todos los precios antiguos y nuevos
    const oldPrices = document.querySelectorAll('.old-product-price');
    const newPrices = document.querySelectorAll('.product-price');

    // Verificar si la cantidad de oldPrices y newPrices coincide
    if (oldPrices.length !== newPrices.length) {
        console.error('¡Desajuste en el número de elementos de precios antiguos y nuevos!');
        return;
    }

    oldPrices.forEach((oldPrecio, index) => {
        // Analizar el precio antiguo como un número
        const oldPriceValue = parseFloat(oldPrecio.textContent || oldPrecio.value);

        // Calcular el nuevo precio (25% del precio antiguo)
        const newPriceValue = (oldPriceValue * 0.75).toFixed(2);

        // Actualizar el elemento de precio nuevo correspondiente
        if (newPrices[index]) {
            if (newPrices[index].tagName === 'INPUT') {
                newPrices[index].value = newPriceValue; // Para campos de entrada
            } else {
                newPrices[index].textContent = `${newPriceValue}€`; // Para spans u otros elementos
            }
        }
    });
}

function updateSetStyle() {
    // Seleccionar todos los productos
    const products = document.querySelectorAll('.product');

    products.forEach(product => {
        // Encontrar el campo oculto para el ID del juego del producto
        const productGame = product.querySelector('.hidden');
        
        if (productGame) {
            const gameValue = productGame.value;

            // Agregar la clase apropiada según el ID del juego
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
            console.warn('No se encontró campo oculto para el producto:', product);
        }
    });
}

function initializeClickableImages() {
    // Seleccionar todas las imágenes clicables
    const clickableImages = document.querySelectorAll('.clickableimage');

    // Agregar event listeners a cada imagen clicable
    clickableImages.forEach(image => {
        // Agregar un event listener de clic
        image.addEventListener('click', () => {
            // Obtener el valor del atributo data-url
            const url = image.getAttribute('data-url');

            // Verificar si la URL existe y navegar a ella
            if (url) {
                window.location.href = url;
            } else {
                console.warn('No se encontró data-url para la imagen:', image);
            }
        });
    });
}

    
function saveInfo(event) {
        event.preventDefault();
    
        // Obtener el valor del correo electrónico del formulario
        const email = event.target.querySelector('#email').value;
    
        // Función de validación de correo electrónico
        const validateEmail = (email) => {
            return String(email)
                .toLowerCase()
                .match(
                    /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/            );

        };
    
        if (!validateEmail(email)) {
            alert('El e-mail no existe o no es correcto');
            return false;
        }

        alert("El e-mail ha sido registrado correctamente")
    
    }

// Ejecutar las funciones al cargar la ventana
window.onload = () => {
    updatePrice();
    updateSetStyle();
    initializeClickableImages();
};
document.querySelector('.newsletter').addEventListener('submit', saveInfo);
