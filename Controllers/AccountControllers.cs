using Microsoft.AspNetCore.Mvc;

namespace tpFinal.Controllers;

public class AccountController : Controller
{
    public IActionResult InicioSesion(){
        return View();
    }

    public IActionResult Login(string usuario,string contraseña){
        bool correcto = BD.Login(usuario,contraseña);
        if (correcto){
            Usuario user = BD.GetUsuario(usuario);
            ViewBag.Usuario=user;
            Console.WriteLine(user);
            return View("PaginaInicio");
        }

        else{
            ViewBag.ErrorInicio="Contraseña o usuario incorrectos. Intente otra vez.";
            return View("InicioSesion");
        }
    }

       public IActionResult Registrarse(){
        return View("Registrarse");
    }

    public IActionResult Registro(string usuario, string contraseña, string mail)
{
    BD.Registro(usuario, contraseña, mail);
    return View("InicioSesion");
}


    
}
