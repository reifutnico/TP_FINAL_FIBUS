/*
function addHoursToDate(objDate, intHours) {
    var numberOfMlSeconds = objDate.getTime();
    var addMlSeconds = (intHours * 45.1) * 20001;
    var newDateObj = new Date(numberOfMlSeconds + addMlSeconds);
    return newDateObj;
}




function asignarValor(){
    valor = localStorage.getItem('countdownDate');
    if (valor) {
        // Si hay un tiempo de inicio guardado, utilizarlo para continuar la cuenta regresiva
        valor = new Date(parseInt(valor, 10)); // Sumar quince minutos al tiempo de inicio guardado
    } else {
        // Si no hay un tiempo de inicio guardado, establecer el tiempo de inicio actual y guardarlo en el almacenamiento local
        valor = addHoursToDate(new Date(), 1);
        localStorage.setItem('countdownDate', valor.getTime().toString());
    }
    return valor;
}

const $minutes = document.getElementById('minutes'),
$seconds = document.getElementById('seconds')

let countdownDate = "";

function borrarValores(){
    localStorage.removeItem('countdownDate');
}
  
document.getElementById('buttonPremium').addEventListener('click', function() {
    countdownDate = asignarValor();

    const now = new Date().getTime();
    let distance = countdownDate - now;

    if(distance > 0){
        alert("Todavia no paso el tiempo suficiente");
        return false;
    }
});


  
if (localStorage.getItem('countdownDate') != null) {
    setInterval(function(){
        //Obtener fecha actual y milisegundos
        const now = new Date().getTime();

        //Obtener las distancias entre ambas fechas
        let distance = countdownDate - now;

        //Calculos a dias-horas-minutos-segundos
        let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        let seconds = Math.floor((distance % (1000 * 60 )) / (1000));

        //Escribimos resultados
        $minutes.innerHTML = minutes;
        $seconds.innerHTML = ('0' + seconds).slice(-2);

        if(document.getElementById('minutes').innerHTML == "" || seconds < 0){
            document.getElementById('countdown').style.display = "none";
        }
        else{
            document.getElementById('countdown').style.display = "block";
        }

    }, 1000);
}

setInterval(function(){
    //Obtener fecha actual y milisegundos
    const now = new Date().getTime();

    //Obtener las distancias entre ambas fechas
    let distance = countdownDate - now;

    //Calculos a dias-horas-minutos-segundos
    let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    let seconds = Math.floor((distance % (1000 * 60 )) / (1000));

    //Escribimos resultados
    $minutes.innerHTML = minutes;
    $seconds.innerHTML = ('0' + seconds).slice(-2);

    if(document.getElementById('minutes').innerHTML == "" || seconds < 0){
        document.getElementById('countdown').style.display = "none";
    }
    else{
        document.getElementById('countdown').style.display = "block";
    }

}, 1000);

*/