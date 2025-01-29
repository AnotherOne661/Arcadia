/**
 * @file Form validation script for the registration form.
 */

const form = document.getElementById('registration-form');
const nameInput = document.getElementById('name');
const emailInput = document.getElementById('email');
const passwordInput = document.getElementById('password');
const confirmPasswordInput = document.getElementById('confirmPassword');
const addressInput = document.getElementById('address');
const countrySelect = document.getElementById('country');
const creditCardInput = document.getElementById('creditCard');
const submitButton = form.querySelector('button[type="submit"]');

const nameError = document.getElementById('nameError');
const emailError = document.getElementById('emailError');
const passwordError = document.getElementById('passwordError');
const confirmPasswordError = document.getElementById('confirmPasswordError');
const creditCardError = document.getElementById('creditCardError');
const birthdateInput = document.getElementById('birthdate');
const birthdateError = document.getElementById('birthdateError');


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
 * Validates the birthdate input.
 * Ensures that the user is at least 18 years old based on the birthdate entered.
 * @returns {boolean} True if the birthdate is valid, false otherwise.
 */
const validateBirthdate = () => {
    const birthdateValue = birthdateInput.value;
    if (!birthdateValue) {
        birthdateError.style.display = 'none';
        return true; // If there's no value, don't show the error.
    }

    const today = new Date();
    const birthdate = new Date(birthdateValue);
    let age = today.getFullYear() - birthdate.getFullYear();
    const monthDifference = today.getMonth() - birthdate.getMonth();

    if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthdate.getDate())) {
        age--;
    }

    if (age < 18) {
        birthdateError.textContent = 'Debes ser mayor de 18 años para registrarte.';
        birthdateError.style.display = 'block';
        return false;
    }
    birthdateError.style.display = 'none';
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
 * Validates the credit card input.
 * Ensures that the credit card number is a valid 16-digit number if the address and country fields are filled.
 * @returns {boolean} True if the credit card is valid, false otherwise.
 */
const validateCreditCard = () => {
    const creditCardRegex = /^\d{16}$/;
    if (addressInput.value && countrySelect.value && !creditCardRegex.test(creditCardInput.value)) {
        creditCardError.textContent = 'Ingrese un número de tarjeta de crédito válido (16 dígitos).';
        creditCardError.style.display = 'block';
        return false;
    }
    creditCardError.style.display = 'none';
    return true;
};

/**
 * Toggles the visibility of the credit card section based on the presence of address and country values.
 * Displays the credit card section if both address and country are filled.
 */
const toggleCreditCardSection = () => {
    const creditCardSection = document.getElementById('creditCardSection');
    if (addressInput.value && countrySelect.value) {
        creditCardSection.style.display = 'block';
    } else {
        creditCardSection.style.display = 'none';
        creditCardError.style.display = 'none';
    }
};

/**
 * Updates the state of the submit button based on the validation of all fields.
 * Enables or disables the submit button depending on the form's validity.
 */
const updateSubmitButtonState = () => {
    let isFormValid = validateName() && validateEmail() && validatePassword() && validateConfirmPassword() && validateBirthdate();
    submitButton.disabled = !isFormValid; // Enable or disable submit button based on form validation
};

// Event listeners for form fields
nameInput.addEventListener('input', () => {
    validateName();
    updateSubmitButtonState();
});

birthdateInput.addEventListener('change', () => {
    validateBirthdate();  // Re-validate the birthdate when it changes
    updateSubmitButtonState();  // Update the submit button state after validation
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

addressInput.addEventListener('input', () => {
    toggleCreditCardSection();
    validateCreditCard();
});

countrySelect.addEventListener('change', () => {
    toggleCreditCardSection();
    validateCreditCard();
});

creditCardInput.addEventListener('input', () => {
    validateCreditCard();
});

/**
 * Prevents the default form submission behavior and displays a success message.
 * @param {Event} e The form submission event.
 */
form.addEventListener('submit', (e) => {
    e.preventDefault();
    alert('Formulario enviado con éxito');
});