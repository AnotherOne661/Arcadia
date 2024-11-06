const DATA_PATH = "../data/landingEx.json";

function handleImageClick(event) { const url = event.target.getAttribute('data-url'); if (url) { window.location.href = url; } } 
function initializeClickableImages() { document.querySelectorAll('.clickableimage').forEach(image => { image.addEventListener('click', handleImageClick); }); } 
document.addEventListener('DOMContentLoaded', initializeClickableImages);

async function fecthInformation(){
    const data = await fetch(DATA_PATH);
    const json = await data.json();
    renderJson(json);
}
async function renderJson(json){

    const productsDiv = document.querySelector(".products");

    productsDiv.innerHTML= '';


    json.forEach(product => {

        // Create a new div for each product

        const productDiv = document.createElement("div");
        productDiv.classList.add("product");

        const productName = document.createElement("figcaption");
        productName.textContent = product.name;
        productName.classList.add("product-desc");

        const productSet = document.createElement("sub");
        productSet.textContent = product.set;
        productSet.classList.add("product-setdesc");

        const productPrice = document.createElement("p");
        productPrice.textContent = `$${product.price}`;
        productPrice.classList.add("product-price");

        const productButton = document.createElement("button");
        productButton.textContent = "Add to Cart";
        productButton.addEventListener("click", function(){
            addToCart(product);
        });
        productButton.classList.add("product-button");

        const productImageContainer = document.createElement("figure");
        const productImage = document.createElement("img");
        productImage.src = product.image_path;
        productImageContainer.appendChild(productImage);


        productDiv.append(productName, productSet, productPrice, productImageContainer, productButton); 
        productsDiv.append(productDiv); // Append the product div to the products div


     });
}
window.onload = function(){
    fecthInformation();
    redirectImage();
 }
    