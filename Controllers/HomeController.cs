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
        Actual.idUsuario=id;    
        Usuario user = BD.GetUsuarioByID(id);
        ViewBag.Usuario = user;
        ViewBag.Inventario = BD.ObtenerInventario(id);
        return View();
    }

    public IActionResult AbrirSobres(int id){
        Actual.idUsuario=id;    
        Usuario user = BD.GetUsuarioByID(id);
        ViewBag.Usuario = user;
        return View();
    }

    public IActionResult Inventario(){
        Usuario user= BD.GetUsuarioByID(Actual.idUsuario);
        Actual.Monedas=user.Monedas;
        ViewBag.Usuario=user;
        Console.WriteLine(Actual.idUsuario+" "+Actual.Monedas);

        ViewBag.Inventario= BD.ObtenerInventario(Actual.idUsuario);
        return View();
    }
    
    public List<Figuritas> AbrirSobrePAjax(int id)
    {
        ViewBag.Figuritas = BD.AbrirSobreP(id);
        BD.CobrarSobre(8);
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
// PARA VENDER LA FIGURITA
    public IActionResult VenderFigu(int precio, int idFigurita){
        Console.WriteLine(Actual.idUsuario+" "+Actual.Monedas+" "+precio+" "+idFigurita + "sex");
        BD.VenderFigurita(Actual.idUsuario,precio, idFigurita);
        Actual.Monedas+=precio;
        Console.WriteLine(Actual.idUsuario+" "+Actual.Monedas + "huevp");

        return (RedirectToAction("Inventario"));
    }
}