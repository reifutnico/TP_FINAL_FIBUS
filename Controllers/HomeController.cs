using Microsoft.AspNetCore.Mvc;
using tpFinal.Models;

namespace tpFinal.Controllers;

public class HomeController : Controller
{

    public IActionResult InicioSesion(){
        return View();
    }

    [HttpPost]
    public IActionResult Login(string usuario, string contraseña){
        bool correcto = BD.Login(usuario,contraseña);
        if (correcto){
            Usuario user = BD.GetUsuarioByNombre(usuario);
            ViewBag.Usuario = user;
            return RedirectToAction("Album", new {id = user.IdUsuario});
        }

        else{
            ViewBag.MensajeError = true;
            return View("InicioSesion");
        }
    }

    public IActionResult Registrarse(){
        return View("Registrarse");
    }

    
    public IActionResult CambiarContraseña(){
        return View("CambiarContra");
    }

    /*[HttpPost]
    public IActionResult ActualizarContra(string usuario, string contraseña) //seguir con esto, falta terminar el sp y perfeccionar la pantalla de CambiarContra
    {
    int num = BD.CambiarContraseña(usuario,contraseña);
    }*/


    [HttpPost]
    public IActionResult Registro(string usuario, string contraseña, string mail){
    int num = BD.Registro(usuario, contraseña, mail);
    
    if (num == 0)
    {
        return View("InicioSesion");
    }
    else if (num == -1)
    {
        ViewBag.MensajeError = -1;
        return View("Registrarse");
    }
    else if (num == -2) 
    {
        ViewBag.MensajeError = -2;
        return View("Registrarse");
    }
    else
    {
        return View("Registrarse");
    }
}
    

    public IActionResult Album(int id){
        Actual.idUsuario=id;    
        Usuario user = BD.GetUsuarioByID(id);
        ViewBag.Usuario = user;
        ViewBag.Inventario = BD.ObtenerInventario(id);
        return View();
    }

    public IActionResult AbrirSobres(int id){
        Actual.idUsuario=id;    
        Usuario user = BD.GetUsuarioByID(id);
        ViewBag.Sobres = BD.ObtenerSobres();
        ViewBag.Usuario = user;
        return View();
    }

    public IActionResult ComprarSobres(int precio){
      BD.ComprarSobres(Actual.idUsuario,precio);
      Actual.Monedas-=precio;
      return (RedirectToAction("AbrirSobres"));
    }

    public IActionResult Inventario(){
        Usuario user= BD.GetUsuarioByID(Actual.idUsuario);
        ViewBag.Usuario=user;
        ViewBag.Inventario= BD.ObtenerInventario(Actual.idUsuario);
        return View();
    }
    
    public IActionResult Repetidas(){
        Usuario user= BD.GetUsuarioByID(Actual.idUsuario);
        Actual.Monedas=user.Monedas;
        ViewBag.Usuario=user;
        ViewBag.Repetidas= BD.ObtenerRepes(Actual.idUsuario);
        return View();
    }
    
public IActionResult AbrirSobrePAjax(int id)
{
    var figuritas = BD.AbrirSobreP(id);
    return Json(figuritas);
}

public IActionResult AbrirSobreNAjax(int id)
{
    var figurita = BD.AbrirSobreN(id);
    return Json(figurita);
}

    public List<Figuritas> MostrarPagina(int id)
    {
        ViewBag.Figuritas = BD.obtenerFiguritas();
        return ViewBag.Figuritas;
    }


// PARA VENDER LA FIGURITA
    public IActionResult VenderFigu(int precio, int idFigurita){
        BD.VenderFigurita(Actual.idUsuario,precio, idFigurita);
        Actual.Monedas+=precio;
        return (RedirectToAction("Repetidas"));
    }


}