function AbrirSobrePremium(ID) {
    let Temp = "";

    $.ajax(
        {
            url: '/Home/AbrirSobrePAjax',
            type: 'POST',
            dataType: 'JSON',
            data: { id: ID },
            success: function (response) {
                response.forEach(element => {
                    Temp += element.nombre + "<br>";
                });
                $("#figuritasObtenidas").html(Temp);
            }
        });
}


function AbrirSobreNormal(ID) {
    $.ajax(
        {
            url: '/Home/AbrirSobreNAjax',
            type: 'POST',
            dataType: 'JSON',
            data: { id: ID },
            success: function (response) {
                $("#figuritasObtenidas").html(response.nombre);
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