// Tomamos los valores que usaremos para las comprobaciones
const form = document.getElementById('registration-form');
const nameInput = document.querySelector('input[name="username"]');
const emailInput = document.getElementById('email');
const passwordInput = document.getElementById('password');
const confirmPasswordInput = document.getElementById('confirmPassword');
const phoneInput = document.querySelector('input[name="phone"]');
const ageCheckbox = document.getElementById('age');
const termsCheckbox = document.getElementById('terms');
const submitButton = form.querySelector('button[type="submit"]');

// Funcion para poder crear el elemento con el mensaje de error en el siguiente hijo del que cree el error
const createErrorElement = (inputElement) => {
    const errorElement = document.createElement('div');
    errorElement.style.color = 'red';
    errorElement.style.display = 'none';
    inputElement.parentNode.insertBefore(errorElement, inputElement.nextSibling);
    return errorElement;
};

const nameError = createErrorElement(nameInput);
const emailError = createErrorElement(emailInput);
const passwordError = createErrorElement(passwordInput);
const confirmPasswordError = createErrorElement(confirmPasswordInput);
const phoneError = createErrorElement(phoneInput);

// Tan solo verificamos que el nombre esté, en caso de que el required de html fallase
const validateName = () => {
    if (nameInput.value.trim() === '') {
        nameError.textContent = 'El nombre es obligatorio.';
        nameError.style.display = 'block';
        return false;
    }
    nameError.style.display = 'none';
    return true;
};

// Validamos que el email sea adecuado usando un regex
const validateEmail = () => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(emailInput.value)) {
        emailError.textContent = 'Ingrese un correo electrónico válido.';
        emailError.style.display = 'block';
        return false;
    }
    emailError.style.display = 'none';
    return true;
};

// Validamos la contraseña con los requisitos que se mencionan en el texto del error
const validatePassword = () => {
    const passwordRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    if (!passwordRegex.test(passwordInput.value)) {
        passwordError.textContent = 'La contraseña debe tener al menos 8 caracteres, incluir una mayúscula, una minúscula, un número y un carácter especial.';
        passwordError.style.display = 'block';
        return false;
    }
    passwordError.style.display = 'none';
    return true;
};
// Validamos que las constraseñas coincidan además de la validación propia de html 
const validateConfirmPassword = () => {
    if (confirmPasswordInput.value !== passwordInput.value) {
        confirmPasswordError.textContent = 'Las contraseñas no coinciden.';
        confirmPasswordError.style.display = 'block';
        return false;
    }
    confirmPasswordError.style.display = 'none';
    return true;
};
// Validamos el número telefónico para que sea uno válido para españa
const validatePhone = () => {
    const phoneRegex = /^(\+34|0034|34)?[6789]\d{8}$/;
    if (!phoneRegex.test(phoneInput.value)) {
        phoneError.textContent = 'Ingrese un número de teléfono válido.';
        phoneError.style.display = 'block';
        return false;
    }
    phoneError.style.display = 'none';
    return true;
};
// Confirmamso que el usuario acepte ser mayor de edad
const validateAge = () => {
    if (!ageCheckbox.checked) {
        Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Debes de ser mayor de edad",
        });
        return false;
    }
    return true;
};
// Validamos que el usuario haya aceptado los términos y condiciones
const validateTerms = () => {
    if (!termsCheckbox.checked) {
        Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Debes de aceptar los términos y condiciones",
        });
        return false;
    }
    return true;
};
// Habilitamos el registro en caso de que todo funcione adecuadamente
const updateSubmitButtonState = () => {
    let isFormValid = validateName() && validateEmail() && validatePassword() && validateConfirmPassword() && validatePhone();
    submitButton.disabled = !isFormValid;
};

nameInput.addEventListener('blur', validateName);
emailInput.addEventListener('blur', validateEmail);
passwordInput.addEventListener('blur', validatePassword);
confirmPasswordInput.addEventListener('blur', validateConfirmPassword);
phoneInput.addEventListener('blur', validatePhone);

form.addEventListener('submit', (e) => {
    e.preventDefault();
    if (validateAge() && validateTerms()) {
        Swal.fire({
            icon: "success",
            title: "Formulario enviado con éxito",
            text: "Bienvenido",
        }).then(() => {
            form.submit();
        });
    }
});
