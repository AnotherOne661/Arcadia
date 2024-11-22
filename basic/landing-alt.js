// Agregamos el evento para el botón de submit
document.querySelector('.newsletter').addEventListener('submit', saveInfo);

// Función para guardar la información del correo electrónico
function saveInfo(event) {
  // Evitar que se envíe el formulario por defecto
  event.preventDefault();

  // Obtener el valor del correo electrónico
  const email = event.target.querySelector('#email').value;

  // Validar si el correo electrónico es válido
  const validateEmail = (email) => {
      return String(email)
          .toLowerCase()
          .match(
             /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/            );
  };


  if (!validateEmail(email)) {
      // Mostrar un mensaje de error si el correo electrónico no es válido
      alert('El e-mail no existe o no es correcto');
      return false;
  }

  // Mostrar un mensaje de éxito si el correo electrónico es válido
  alert("El e-mail ha sido registrado correctamente")
}

// Función para inicializar los elementos clickables
function initializeClickableImages() {
  // Obtener todos los elementos con la clase 'clickableimage'
  const clickableImages = document.querySelectorAll('.clickableimage');

  // Recorrer cada elemento y agregar un evento de click
  clickableImages.forEach(image => {
      image.addEventListener('click', () => {
          // Obtener el URL asociado al elemento
          const url = image.getAttribute('data-url');

          // Redirigir a la página correspondiente si hay un URL asociado
          if (url) {
              window.location.href = url;
          } else {
              // Mostrar un mensaje de advertencia si no hay un URL asociado
              console.warn('No data-url found for image:', image);
          }
      });
  });
}

// Función para inicializar el carrousel
!(function(d){
  var itemClassName = "carousel__photo";
  // Obtener todos los elementos con la clase 'carousel__photo'
  items = d.getElementsByClassName(itemClassName),
  totalItems = items.length,
  slide = 0,
  moving = true; 

  // Configuración inicial del carrousel
  function setInitialClasses() {
      // Agregar las clases correspondientes a los primeros y últimos elementos
      items[totalItems - 1].classList.add("prev");
      items[0].classList.add("active");
      items[1].classList.add("next");
  }

  // Configuración de eventos para el carrousel
  function setEventListeners() {
      var next = d.getElementsByClassName('carousel__button--next')[0],
          prev = d.getElementsByClassName('carousel__button--prev')[0];

      next.addEventListener('click', moveNext);
      prev.addEventListener('click', movePrev);
  }

  // Configuración de la interacción con el carrousel
  function disableInteraction() {
      moving = true;

      setTimeout(function(){
          moving = false
      }, 500);
  }

  // Movimiento del carrousel a una posición determinada
  function moveCarouselTo(slide) {
      if(!moving) {
          disableInteraction();

          var newPrevious = slide - 1,
              newNext = slide + 1,
              oldPrevious = slide - 2,
              oldNext = slide + 2;

          // Ajustar las clases de los elementos según la posición actual
          if ((totalItems - 1) > 3) {
              if (newPrevious <= 0) {
                  oldPrevious = (totalItems - 1);
              } else if (newNext >= (totalItems - 1)){
                  oldNext = 0;
              }

              if (slide === 0) {
                  newPrevious = (totalItems - 1);
                  oldPrevious = (totalItems - 2);
                  oldNext = (slide + 1);
              } else if (slide === (totalItems -1)) {
                  newPrevious = (slide - 1);
                  newNext = 0;
                  oldNext = 1;
              }

              // Ajustar las clases de los elementos según la posición deseada
              items[oldPrevious].className = itemClassName;
              items[oldNext].className = itemClassName;
              items[newPrevious].className = itemClassName + " prev";
              items[slide].className = itemClassName + " active";
              items[newNext].className = itemClassName + " next";
          }
      }
  }

  // Movimiento al elemento siguiente del carrousel
  function moveNext() {
      if (!moving) {
          if (slide === (totalItems - 1)) {
              slide = 0;
          } else {
              slide++;
          }

          moveCarouselTo(slide);
      }
  }

  // Movimiento al elemento anterior del carrousel
  function movePrev() {
      if (!moving) {
  
        if (slide === (totalItems - 1)) {
          slide = 0;
        } else {
          slide++;
        }
  
        moveCarouselTo(slide);
      }
    }
  // Movimiento al elemento anterior del carrousel
    function movePrev() {
  
      if (!moving) {
  
        if (slide === 0) {
          slide = (totalItems - 1);
        } else {
          slide--;
        }
  
        moveCarouselTo(slide);
      }
    }
  // Se inicia el carrusel
    function initCarousel() {
      setInitialClasses();
      setEventListeners();
      
      moving = false;
    }
  
    initCarousel();
  
  }(document));
window.onload = function(){
    initializeClickableImages();
    showImage(currentIndex);
 }
    