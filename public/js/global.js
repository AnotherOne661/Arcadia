const c_year = new Date().getFullYear();

function getYear(){
  const spanYear = document.querySelector("[data-curdate]");
  spanYear.innerHTML = c_year;
}
window.onload= function(){
  getYear();
  initializeClickableImages();
}

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


function fetchAllCollections(){
  var colecciones = document.querySelector('[data-collections]');

  colecciones.addEventListener('click', function(e) {
    console.log('Link clicked'); // Debug log

    e.preventDefault(); // Prevent default link behavior
    console.log('Link clicked'); // Debug log

    // Make AJAX call to collectionRouter.php
    fetch('collectionRouter.php?action=getAllResults')
        .then(response => response.json())
        .then(data => {
            // Handle the response data here
            console.log(data);
        })
        .catch(error => {
          console.error('Collections link not found'); // Debug log
        });
});
}