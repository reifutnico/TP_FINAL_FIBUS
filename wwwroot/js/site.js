
function showPassword() {
    const passwordField = document.getElementById('Contraseña');
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
    } else {
        passwordField.type = 'password';
    }
}


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



/*-----------*/

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

function MostrarPagina(ID, numInicio) {
    let i = 0;

    $.ajax(
        {
            url: '/Home/MostrarPagina',
            type: 'POST',
            dataType: 'JSON',
            data: { id: ID },
            success: function (response) {
                if (32 == numInicio) {
                    $("#carta7").attr("style", "opacity: 0;")
                    $("#carta8").attr("style", "opacity: 0;")
                }
                else{
                    $("#carta7").attr("style", "opacity: 1;")
                    $("#carta8").attr("style", "opacity: 1;")
                }
                response.forEach(element => {
                    i++;
                    $("#NombreJugador" + i).html(response[numInicio].numero);
                    numInicio++;
                });
            }
        });
}