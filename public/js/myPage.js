function main() {
  document.querySelector(".edit").addEventListener("click", () => {
    document.querySelector(".edit").style.display = "none";
    document.querySelector(".edit-form").classList.remove("hidden");
    document.querySelector(".edit-form").style.display = "flex";
  });
  /**
 * @file Form validation script for the registration form.
 */

  const form = document.querySelector('.edit-form');
  const nameInput = document.querySelector('input[name="username"]');
const emailInput = document.getElementById('email');
const passwordInput = document.getElementById('password');
const confirmPasswordInput = document.getElementById('confirmPassword');
const submitButton = form.querySelector('button[type="submit"]');
const phoneInput = document.querySelector('input[name="phone"]');

const nameError = document.createElement('div');
nameError.classList.add("error");
nameError.style.color = 'red';
nameError.style.display = 'none';
nameInput.parentNode.insertBefore(nameError, nameInput.nextSibling);

const emailError = document.createElement('div');
emailError.classList.add("error");
emailError.style.color = 'red';
emailError.style.display = 'none';
emailInput.parentNode.insertBefore(emailError, emailInput.nextSibling);

const passwordError = document.createElement('div');
passwordError.classList.add("error");
passwordError.style.color = 'red';
passwordError.style.display = 'none';
passwordInput.parentNode.insertBefore(passwordError, passwordInput.nextSibling);

const confirmPasswordError = document.createElement('div');
confirmPasswordError.classList.add("error");
confirmPasswordError.style.color = 'red';
confirmPasswordError.style.display = 'none';
confirmPasswordInput.parentNode.insertBefore(confirmPasswordError, confirmPasswordInput.nextSibling);

const phoneError = document.createElement('div');
phoneError.classList.add("error");
phoneError.style.color = 'red';
phoneError.style.display = 'none';
phoneInput.parentNode.insertBefore(phoneError, phoneInput.nextSibling);

/**
 * Validates the name input.
 * Ensures that the name field is not empty.
 * @returns {boolean} True if the name is valid, false otherwise.
 */
const validateName = () => {
    if (nameInput.value.trim() === '') {
        nameError.textContent = 'El nombre es obligatorio.';
        nameError.style.display = 'block';
        return false;
    }
    nameError.style.display = 'none';
    return true;
};

/**
 * Validates the email input.
 * Ensures that the email entered is in a valid format.
 * @returns {boolean} True if the email is valid, false otherwise.
 */
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

/**
 * Validates the password input.
 * Ensures that the password meets specific requirements: at least 8 characters, includes uppercase, lowercase, number, and special character.
 * @returns {boolean} True if the password is valid, false otherwise.
 */
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

/**
 * Validates the confirm password input.
 * Ensures that the confirm password matches the password entered.
 * @returns {boolean} True if the confirm password matches the password, false otherwise.
 */
const validateConfirmPassword = () => {
    if (confirmPasswordInput.value !== passwordInput.value) {
        confirmPasswordError.textContent = 'Las contraseñas no coinciden.';
        confirmPasswordError.style.display = 'block';
        return false;
    }
    confirmPasswordError.style.display = 'none';
    return true;
};

/**
 * Validates the phone input.
 * Ensures that the phone number is a valid 9-digit number.
 * @returns {boolean} True if the phone number is valid, false otherwise.
 */
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


/**
 * Updates the state of the submit button based on the validation of all fields.
 * Enables or disables the submit button depending on the form's validity.
 */
const updateSubmitButtonState = () => {
    let isFormValid = validateName() && validateEmail() && validatePassword() && validateConfirmPassword() && validatePhone();
    submitButton.disabled = !isFormValid; // Enable or disable submit button based on form validation
};

// Event listeners for form fields
nameInput.addEventListener('input', () => {
    validateName();
    updateSubmitButtonState();
});

emailInput.addEventListener('input', () => {
    validateEmail();
    updateSubmitButtonState();
});

passwordInput.addEventListener('input', () => {
    validatePassword();
    validateConfirmPassword();
    updateSubmitButtonState();
});

confirmPasswordInput.addEventListener('input', () => {
    validateConfirmPassword();
    updateSubmitButtonState();
});

phoneInput.addEventListener('input', () => {
    validatePhone();
    updateSubmitButtonState();
});

/**
 * Prevents the default form submission behavior and displays a success message.
 * @param {Event} e The form submission event.
 */
form.addEventListener('submit', (e) => { 
    e.preventDefault();  // Prevent default form submission

        Swal.fire({
            icon: "success",
            title: "Formulario enviado con éxito",
            text: "Bienvenido",      
        }).then(() => {
            // Only submit the form and trigger the redirect after the alert has been closed
            form.submit();
        });
    }
  )}
main();
