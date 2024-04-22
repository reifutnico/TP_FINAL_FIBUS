
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
            console.log("a");

            if(response != null)
            { 
                response.forEach(element => {
                temp += `<img src="/img/jugadores/${element.imagenJugador}" alt="${element.nombre}" class="img-figuritaSobre"/>`;
                });
                $("#figuritasObtenidas").html(`<h3>¡TUS FIGURITAS!</h3>` + temp);

            }else{
                $("#figuritasObtenidas").html(`<h3>No tenes monedas suficientes!</h3>`);
                }
            }
        }
    );
    
    RestarMonedas(8)
    
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
            console.log("a");

            if(response != null)
            { 
                response.forEach(element => {
                temp += `<img src="/img/jugadores/${element.imagenJugador}" alt="${element.nombre}" class="img-figuritaSobre"/>`;
                });
                $("#figuritasObtenidas").html(`<h3>¡TUS FIGURITAS!</h3>` + temp);

            }else{
                $("#figuritasObtenidas").html(`<h3>No tenes monedas suficientes!</h3>`);
            }
            }
        }
    );
    RestarMonedas(4)
   
}

function GanarMonedas(p){
    $.ajax({
        url: '/Home/Recibir',
        type: 'POST',
        dataType: 'JSON',
        data: {precio:p},
        success: function(response){
            $("#lugarMonedas").html(response + '<img src="/img/moneda.png">');
        }
    })
}
function GanarMonedasVideos() {
    // Lista de videos de YouTube
    var videos = [
        'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        'https://www.youtube.com/watch?v=D5GQ9br7voU'
    ];
    var randomIndex = Math.floor(Math.random() * videos.length);
    var randomVideoURL = videos[randomIndex];
    window.open(randomVideoURL, '_blank');
    $.ajax({
        url: '/Home/RecibirVideos',
        type: 'POST',
        dataType: 'JSON',
        data: {},
        success: function(response) {
            $("#lugarMonedas").html(response + '<img src="/img/moneda.png">');
        }
    });
}



function RestarMonedas(p){
    $.ajax({
        url: '/Home/Comprar',
        type: 'POST',
        dataType: 'JSON',
        data: {precio:p},
        success: function(response){
            $("#lugarMonedas").html(response + '<img src="/img/moneda.png">');
        }
    })
}
function Vender(id,precio){
    $.ajax({
        url: '/Home/ActualizarRepetidas',
        data: {idFigu: id},
        type: 'POST',
        dataType: 'JSON',
       error: function(){
            console.log("aaaaa")
            $("#" + id).remove()
            GanarMonedas(precio)
        }
    });
}

function Publicar(id){
    $.ajax({
        url: '/Home/ActualizarRepetidas',
        data: {idFigu: id},
        type: 'POST',
        dataType: 'JSON',
       error: function(){
            console.log("aaaaa")
            $("#" + id).remove()
        }
    });
}

function AbrirSobreModal(opcion, idUsuario) {
        $.ajax({
            url: '/Home/AbrirModalSobre',
            data: { opcion: opcion },
            type: 'POST',
            dataType: 'JSON',
            success: function (response) {
                if (opcion == 1) {
                    $("#buttonPremium").attr("id", "buttonNormal")
                    $("#buttonNormal").attr("onclick", "AbrirSobreNormal(" + idUsuario + ")")
                } else {
                    $("#buttonNormal").attr("id", "buttonPremium")
                    $("#buttonPremium").attr("onclick", "AbrirSobrePremium(" + idUsuario + ")")
                }
                $("#descripcionModal").html(response.descripcion)
                $("#tituloModal").html(response.nombre)
                $("#valorModal").html(response.valor)
                $("#candidadModal").html(response.cantidad)
            }
        });

}

function venderFiguritaMercado(precioActual, idFigurita) {
    var nuevaDescripcion = prompt("Ingrese la descripción:");
    var nuevoPrecio = prompt("Ingrese el nuevo precio:");
    
    if (nuevaDescripcion !== null && nuevoPrecio !== null) {
        $.ajax({
            url: '/Home/VenderFiguritaMercado',
            type: 'POST',
            data: {
                precio: nuevoPrecio,
                descripcion: nuevaDescripcion,
                idFigurita: idFigurita
            },
            success: function(data) {
                console.log("Venta realizada con éxito.");
            },
            error: function(xhr, textStatus, errorThrown) {
                console.error("Error al realizar la venta:", errorThrown);
            }
        });
    } else {
        console.log("Venta cancelada por el usuario.");
    }
}

function publicarAlMercadoYV(precio, idFigurita) {
    venderFiguritaMercado(precio, idFigurita);
    Vender(idFigurita,0); 
}


function ComprarFiguPublicada(params) {
    
}