const DATA_PATH = "../data/landingEx.json";
// JSON temporal

// Evento de redireccion en las imagenes
function handleImageClick(event) { 
    // Obtener la URL de la imagen clickeada (está en el html element)
    const url = event.target.getAttribute('data-url');
     if (url) { 
        window.location.href = url;
    } 
} 
function initializeClickableImages() {
    // Recorre las imágenes y les agrega a cada una un evento de click que llama a la función handleImageClick
    document.querySelectorAll('.clickableimage').forEach(image => {
         image.addEventListener('click', handleImageClick);
         });
} 
// Añade el evento de la imagen clickeada, iniciando la función ClickableImages
document.addEventListener('DOMContentLoaded', initializeClickableImages);


// Función para obtener la información de los productos
async function fecthInformation(){
    const data = await fetch(DATA_PATH);
    const json = await data.json();
    renderJson(json);
}

// Función que renderiza los productos
async function renderJson(json){

    // Limpia los productos anteriores y localiza el div products
    const productsDiv = document.querySelector(".products");

    productsDiv.innerHTML= '';


    // Renderiza cada producto en el div products
    json.forEach(product => {

        // Create a new div for each product

        const productDiv = document.createElement("div");
        productDiv.classList.add("product");

        // Creamos un figcaption con la clase product-desc que contiene el nombre del producto
        const productName = document.createElement("figcaption");
        productName.textContent = product.name;
        productName.classList.add("product-desc");

        // Creamos un sub con la clase product-setdesc que contiene el set del producto
        const productSet = document.createElement("sub");
        productSet.textContent = product.set;
        productSet.classList.add("product-setdesc");

        // Agrega la clase del juego al sub para darle estilo específico
        const game = product.game;
        productSet.classList.add(game);


        // Creamos un elemento p con la clase product-price que contiene el precio del producto
        const productPrice = document.createElement("p");
        productPrice.textContent = `${product.price}€`;
        productPrice.classList.add("product-price");

        // Creamos un botón con la clase product-button que contiene el texto "Add to Cart"
        const productButton = document.createElement("button");
        productButton.textContent = "Add to Cart";
        productButton.addEventListener("click", function(){
            addToCart(product);
        });
        productButton.classList.add("product-button");

        // Creamos una figura con la clase clickableimage para darle estilo de imagen
        const productImageContainer = document.createElement("figure");
        const productImage = document.createElement("img");
        productImage.src = product.image_path;
        productImageContainer.appendChild(productImage);

        // Agregamos los elementos al div producto
        productDiv.append(productName, productSet, productPrice, productImageContainer, productButton); 
        productsDiv.append(productDiv); // Append the product div to the products div


     });
}
// Se ejecuta al cargar la página
window.onload = function(){
    fecthInformation();
    redirectImage();
 }
    