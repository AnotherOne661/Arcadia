/**
 * @file Form validation script for the registration form.
 */

const form = document.getElementById('registration-form');
const nameInput = document.querySelector('input[name="username"]');
const emailInput = document.getElementById('email');
const passwordInput = document.getElementById('password');
const confirmPasswordInput = document.getElementById('confirmPassword');
const phoneInput = document.querySelector('input[name="phone"]');
const ageCheckbox = document.getElementById('age');
const termsCheckbox = document.getElementById('terms');
const submitButton = form.querySelector('button[type="submit"]');

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

const validateName = () => {
    if (nameInput.value.trim() === '') {
        nameError.textContent = 'El nombre es obligatorio.';
        nameError.style.display = 'block';
        return false;
    }
    nameError.style.display = 'none';
    return true;
};

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

const validateConfirmPassword = () => {
    if (confirmPasswordInput.value !== passwordInput.value) {
        confirmPasswordError.textContent = 'Las contraseñas no coinciden.';
        confirmPasswordError.style.display = 'block';
        return false;
    }
    confirmPasswordError.style.display = 'none';
    return true;
};

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
