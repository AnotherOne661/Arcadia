
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
// JSON temporal

// Evento de redireccion en las imagenes

// Añade el evento de la imagen clickeada, iniciando la función ClickableImages
document.addEventListener('DOMContentLoaded', initializeClickableImages);


// Function to update styles based on the game's class


// Se ejecuta al cargar la página
window.onload = function(){
    initializeClickableImages();
 }
    