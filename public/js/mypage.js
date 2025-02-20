// Añadimos los eventos que llevan a cabo la validación en los propios campos con errores
function main() {
    document.querySelector(".edit").addEventListener("click", () => {
      document.querySelector(".edit").style.display = "none";
      document.querySelector(".edit-form").classList.remove("hidden");
      document.querySelector(".edit-form").style.display = "flex";
    });
  
    const form = document.querySelector(".edit-form");
    const fields = [
      { input: "input[name='username']", errorMsg: "El nombre es obligatorio.", validator: (value) => value.trim() !== "" },
      { input: "#email", errorMsg: "Ingrese un correo electrónico válido.", validator: (value) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value) },
      { input: "#password", errorMsg: "La contraseña debe tener al menos 8 caracteres, incluir una mayúscula, una minúscula, un número y un carácter especial.", validator: (value) => /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(value) },
      { input: "#confirmPassword", errorMsg: "Las contraseñas no coinciden.", validator: (value) => value === document.querySelector("#password").value },
      { input: "input[name='phone']", errorMsg: "Ingrese un número de teléfono válido.", validator: (value) => /^(\+34|0034|34)?[6789]\d{8}$/.test(value) }
    ];
    
    fields.forEach(({ input, errorMsg, validator }) => {
      const field = document.querySelector(input);
      const errorDiv = document.createElement("div");
      errorDiv.classList.add("error");
      errorDiv.style.color = "red";
      errorDiv.style.display = "none";
      field.parentNode.insertBefore(errorDiv, field.nextSibling);
  
      field.addEventListener("blur", () => {
        if (!validator(field.value)) {
          errorDiv.textContent = errorMsg;
          errorDiv.style.display = "block";
        } else {
          errorDiv.style.display = "none";
        }
        updateSubmitButtonState();
      });
    });
    
    const submitButton = form.querySelector("button[type='submit']");
    
    const updateSubmitButtonState = () => {
      submitButton.disabled = fields.some(({ input, validator }) => !validator(document.querySelector(input).value));
    };
  
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      Swal.fire({
        icon: "success",
        title: "Formulario enviado con éxito",
        text: "Bienvenido",
      }).then(() => form.submit());
    });
  }
  
  main();
  