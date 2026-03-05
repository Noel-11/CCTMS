function validatePassword() {
    const password = document.getElementById("password").value;

    const length = document.getElementById("length");
    const uppercase = document.getElementById("uppercase");
    const number = document.getElementById("number");
    const special = document.getElementById("special");

    // 8 characters
    if (password.length >= 8) {
        length.classList.remove("invalid");
        length.classList.add("valid");
        length.innerHTML = "✔ At least 8 characters";
    } else {
        length.classList.remove("valid");
        length.classList.add("invalid");
        length.innerHTML = "❌ Must be at least 8 characters";
    }

    // Uppercase
    if (/[A-Z]/.test(password)) {
        uppercase.classList.remove("invalid");
        uppercase.classList.add("valid");
        uppercase.innerHTML = "✔ Contains at least 1 uppercase letter";
    } else {
        uppercase.classList.remove("valid");
        uppercase.classList.add("invalid");
        uppercase.innerHTML = "❌ Must contain at least 1 uppercase letter";
    }

    // Number
    if (/[0-9]/.test(password)) {
        number.classList.remove("invalid");
        number.classList.add("valid");
        number.innerHTML = "✔ Contains at least 1 number";
    } else {
        number.classList.remove("valid");
        number.classList.add("invalid");
        number.innerHTML = "❌ Must contain at least 1 number";
    }

    // Special character
    if (/[^A-Za-z0-9]/.test(password)) {
        special.classList.remove("invalid");
        special.classList.add("valid");
        special.innerHTML = "✔ Contains at least 1 special character";
    } else {
        special.classList.remove("valid");
        special.classList.add("invalid");
        special.innerHTML = "❌ Must contain at least 1 special character";
    }
}