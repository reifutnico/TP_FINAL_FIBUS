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
            ViewBag.ErrorInicio = "Contraseña o usuario incorrectos. Intente otra vez.";
            return View("InicioSesion");
        }
    }

    public IActionResult Registrarse(){
        return View("Registrarse");
    }

    [HttpPost]
    public IActionResult Registro(string usuario, string contraseña, string mail)
    {
        BD.Registro(usuario, contraseña, mail);
        return View("InicioSesion");
    }

    public IActionResult Album(int id){
        Usuario user = BD.GetUsuarioByID(id);
        ViewBag.Usuario = user;
        ViewBag.Inventario = BD.ObtenerInventario(id);
        return View();
    }

    public IActionResult AbrirSobres(int id){
        ViewBag.Usuario = BD.GetUsuarioByID(id);
        return View();
    }

    public IActionResult Inventario(int id){
        ViewBag.Usuario = BD.GetUsuarioByID(id);
        ViewBag.Inventario = BD.ObtenerInventario(id);
        return View();
    }
    
    public List<Figuritas> AbrirSobrePAjax(int id)
    {
        ViewBag.Figuritas = BD.AbrirSobreP(id);
        return ViewBag.Figuritas;
    }
    public Figuritas AbrirSobreNAjax(int id)
    {
        ViewBag.Figurita = BD.AbrirSobreN(id);
        return ViewBag.Figurita;
    }
    public List<Figuritas> MostrarPagina(int id)
    {
        ViewBag.Figuritas = BD.obtenerFiguritas();
        return ViewBag.Figuritas;
    }
}