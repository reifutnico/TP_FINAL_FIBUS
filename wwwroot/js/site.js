


//Inicio sesion

function showPassword() {
    const passwordField = document.getElementById('Contraseña');
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
    } else {
        passwordField.type = 'password';
    }
}

//Validar seguridad de la Contraseña, debe tener 8 caracteres, una mayus y una especial. Validar que sea la misma que sea la misma de confirmar 

function validatePassword() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var resultado = document.getElementById("resultado");
    var confirmacion = document.getElementById("confirmacion");


    var Especial = /[\W_]/;
    var Mayuscula = /[A-Z]/; 
    var longitud = password.length >= 8; 

    var Valido = Especial.test(password) && Mayuscula.test(password) && longitud;

    if (Valido) {
        resultado.style.color = "green";
        resultado.innerHTML = "Contraseña válida";
    } else {
        resultado.style.color = "red";
        resultado.innerHTML = "La contraseña debe tener al menos 8 caracteres, una letra mayúscula y un carácter especial";
    }

    // Validación de coincidencia de contraseña y confirmación
    if (password === confirmPassword && confirmPassword !== '') {
        confirmacion.style.color = "green";
        confirmacion.innerHTML = "Las contraseñas coinciden";
    } else {
        confirmacion.style.color = "red";
        confirmacion.innerHTML = "Las contraseñas no coinciden";
    }
}

/*Abrir sobres*/

//premium - 5 figus
function AbrirSobrePremium(ID) {
    $.ajax({
        url: '/Home/AbrirSobrePAjax',
        type: 'POST',
        dataType: 'JSON',
        data: { id: ID },
        success: function (response) {
            let temp = "";

            response.forEach(element => {
                temp += `<img src="/img/jugadores/${element.imagenJugador}" alt="${element.nombre}" class="img-figuritaSobre"/>`;
            });

            $("#figuritasObtenidas").html(temp);
        }
    });
}

//normal - 3 figus
function AbrirSobreNormal(ID) {
    $.ajax({
        url: '/Home/AbrirSobreNAjax',
        type: 'POST',
        dataType: 'JSON',
        data: { id: ID },
        success: function (response) {
            let temp = "";

            response.forEach(element => {
                temp += `<img src="/img/jugadores/${element.imagenJugador}" alt="${element.nombre}" class="img-figuritaSobre"/>`;
            });

            $("#figuritasObtenidas").html(temp);
        }
    });
}

