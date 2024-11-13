document.getElementById('loadCollections').addEventListener('click', () => {
  fetch('http://localhost:7000/Controllers/collectionRouter.php') // Ruta correcta hacia tu archivo PHP
    .then(response => response.json())
    .then(data => {
      // Obtener el contenedor donde se mostrará la información
      const container = document.createElement('div');
      container.id = 'collectionsContainer';
      document.body.appendChild(container);

      // Limpiar el contenido anterior (si es necesario)
      container.innerHTML = '';

      // Procesar y renderizar los datos en la página
      data.forEach(collection => {
        const item = document.createElement('p');
        item.textContent = `ID: ${collection.id} - Nombre: ${collection.nombre}`; // Ajusta según tus campos de datos
        container.appendChild(item);
      });
    })
    .catch(error => {
      console.error('Error fetching data:', error);
    });
});
