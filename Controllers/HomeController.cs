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

    [HttpPost]
    public IActionResult ActualizarContra(string usuario, string contraseña, string nuevacontraseña, string confirmarContraseña)
    {
    int num = BD.CambiarContraseña(usuario,contraseña,nuevacontraseña,confirmarContraseña);
    if (num == 0)
    {
        return View("InicioSesion");
    }
    else if (num == -1)
    {
        ViewBag.MensajeErrorCAMBIARCONTRA = -1;
        return View("CambiarContra");
    }
    else if (num == -2) 
    {
        ViewBag.MensajeErrorCAMBIARCONTRA = -2;
        return View("CambiarContra");
    }
     else if (num == -3) 
    {
        ViewBag.MensajeErrorCAMBIARCONTRA = -3;
        return View("CambiarContra");
    }
         else if (num == -4) 
    {
        ViewBag.MensajeErrorCAMBIARCONTRA = -4;
        return View("CambiarContra");
    }
    else
    {
        return View("CambiarContra");
    }
    }


    [HttpPost]
    public IActionResult Registro(string usuario, string contraseña, string confirmarContraseña, string mail)
    {
    int num = BD.Registro(usuario, contraseña, confirmarContraseña, mail);
    
    if (num == 0)
    {
        return View("InicioSesion");
    }
    else if (num == -1)
    {
        ViewBag.MensajeErrorREGISTRARSE = -1;
        return View("Registrarse");
    }
    else if (num == -2) 
    {
        ViewBag.MensajeErrorREGISTRARSE = -2;
        return View("Registrarse");
    }
     else if (num == -3) 
    {
        ViewBag.MensajeErrorREGISTRARSE = -3;
        return View("Registrarse");
    }
     else if (num == -4) 
    {
        ViewBag.MensajeErrorREGISTRARSE = -4;
        return View("Registrarse");
    }
      else if (num == -5) 
    {
        ViewBag.MensajeErrorREGISTRARSE = -5;
        return View("Registrarse");
    }
         else if (num == -6) 
    {
        ViewBag.MensajeErrorREGISTRARSE = -6;
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
        ViewBag.Figuritas= BD.obtenerFiguritas();
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
    
public IActionResult AbrirSobrePAjax(int id){
    var figuritas = BD.AbrirSobreP(id);
    return Json(figuritas);}


public IActionResult AbrirSobreNAjax(int id){
    var figurita = BD.AbrirSobreN(id);
    return Json(figurita);}



// PARA VENDER LA FIGURITA
public IActionResult VenderFigu(int precio, int idFigurita){
        BD.VenderFigurita(Actual.idUsuario,precio, idFigurita);
        Actual.Monedas+=precio;
        return (RedirectToAction("Repetidas"));
}


public IActionResult Pagina(int id, int equipo){
        Actual.idUsuario=id;    
        Usuario user = BD.GetUsuarioByID(id);
        ViewBag.Usuario = user;
        ViewBag.JugadoresPaises = BD.SeparaFiguritasEquipo(equipo);
        ViewBag.InventarioPaises = BD.ObtenerInventarioPaises(id,equipo);
        return View();
}

}