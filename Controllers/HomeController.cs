using Microsoft.AspNetCore.Mvc;
using tpFinal.Models;

namespace tpFinal.Controllers;

public class HomeController : Controller
{
    public IActionResult InicioSesion()
    {
        return View();
    }

    [HttpPost]
    public IActionResult Login(string usuario, string contraseña)
    {
        bool correcto = BD.Login(usuario, contraseña);
        if (correcto)
        {
            Usuario user = BD.GetUsuarioByNombre(usuario);
            ViewBag.Usuario = user;
            TempData["UsuarioActual"] = user.IdUsuario;
            // Console.WriteLine(idUsuarioActual + "!!!");
            return RedirectToAction("Album", new { id = user.IdUsuario });
        }
        else
        {
            ViewBag.MensajeError = true;
            return View("InicioSesion");
        }
    }

    public void ActualizarRepetidas(int idFigu)
    {
        int idUsuarioActual = (int)TempData["UsuarioActual"];
        Usuario user = BD.GetUsuarioByID(idUsuarioActual);
        int idInventario = BD.ObtenerIdInventario(user.IdUsuario);
        BD.CambiarRepetidas(idInventario, idFigu);
        TempData["UsuarioActual"] = idUsuarioActual;
    }

    public IActionResult Registrarse()
    {
        return View("Registrarse");
    }

    public IActionResult CambiarContraseña()
    {
        return View("CambiarContra");
    }

    [HttpPost]
    public IActionResult ActualizarContra(string usuario,string contraseña,string nuevacontraseña,string confirmarContraseña)
    {
        int num = BD.CambiarContraseña(usuario, contraseña, nuevacontraseña, confirmarContraseña);
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
    public IActionResult Registro(string usuario,string contraseña,string confirmarContraseña,string mail)
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

    public IActionResult Album()
    {
        int idUsuarioActual = (int)TempData["UsuarioActual"];
        Usuario user = BD.GetUsuarioByID(idUsuarioActual);
        ViewBag.Usuario = user;
        ViewBag.Usuario.Monedas = user.Monedas;
        ViewBag.Inventario = BD.ObtenerInventario(idUsuarioActual);
        TempData["UsuarioActual"] = idUsuarioActual;
        return View();
    }

    public IActionResult AbrirSobres()
    {
        int idUsuarioActual = (int)TempData["UsuarioActual"];
        Usuario user = BD.GetUsuarioByID(idUsuarioActual);
        ViewBag.Usuario = user;
        ViewBag.Sobres = BD.ObtenerSobres();
        TempData["UsuarioActual"] = idUsuarioActual;
        return View();
    }

    public IActionResult ComprarSobres(int precio)
    {
        int idUsuarioActual = (int)TempData["UsuarioActual"];
        Usuario user = BD.GetUsuarioByID(idUsuarioActual);
        ViewBag.Usuario = user;
        TempData["UsuarioActual"] = idUsuarioActual;
        return (RedirectToAction("AbrirSobres"));
    }

    public IActionResult Inventario()
    {
        int idUsuarioActual = (int)TempData["UsuarioActual"];
        Usuario user = BD.GetUsuarioByID(idUsuarioActual);
        ViewBag.Usuario = user;
        ViewBag.Figuritas = BD.obtenerFiguritas();
        ViewBag.Inventario = BD.ObtenerInventario((int)TempData["UsuarioActual"]);
        TempData["UsuarioActual"] = idUsuarioActual;
        return View();
    }

    public int Recibir(int precio)
    {
        int idUsuarioActual = (int)TempData["UsuarioActual"];
        Usuario user = BD.GetUsuarioByID(idUsuarioActual);
        int cantMonedas = user.Monedas + precio;

        BD.CambiarMonedas(idUsuarioActual, cantMonedas);
        TempData["UsuarioActual"] = idUsuarioActual;
        return cantMonedas;
    }

        public int RecibirVideos()
    {
        int idUsuarioActual = (int)TempData["UsuarioActual"];
        Usuario user = BD.GetUsuarioByID(idUsuarioActual);
        int cantMonedas = user.Monedas + 5;
        BD.CambiarMonedas(idUsuarioActual, cantMonedas);
        TempData["UsuarioActual"] = idUsuarioActual;
        return cantMonedas;
    }

    public int Comprar(int precio)
    {
        int idUsuarioActual = (int)TempData["UsuarioActual"];
        Usuario user = BD.GetUsuarioByID(idUsuarioActual);
        int cantMonedas = user.Monedas;
        if (user.Monedas >= precio)
            cantMonedas = user.Monedas - precio;
        BD.CambiarMonedas(idUsuarioActual, cantMonedas);
        TempData["UsuarioActual"] = idUsuarioActual;
        return cantMonedas;
    }

    public IActionResult Repetidas()
    {
        int idUsuarioActual = (int)TempData["UsuarioActual"];
        Usuario user = BD.GetUsuarioByID(idUsuarioActual);
        ViewBag.Usuario = user;
        ViewBag.Repetidas = BD.ObtenerRepes((int)TempData["UsuarioActual"]);
        TempData["UsuarioActual"] = idUsuarioActual;
        return View();
    }

    public IActionResult AbrirSobrePAjax(int id)
    {
        int idUsuarioActual = (int)TempData["UsuarioActual"];
        Usuario user = BD.GetUsuarioByID(idUsuarioActual);
        if (user.Monedas >= 8)
        {
        var figuritas = BD.AbrirSobreP(id);
        TempData["UsuarioActual"] = idUsuarioActual;
        return Json(figuritas);
        }else{
        TempData["UsuarioActual"] = idUsuarioActual;
        Console.WriteLine("a");
        return Json(null);
        }
    }

    public IActionResult AbrirSobreNAjax(int id)
    {
         int idUsuarioActual = (int)TempData["UsuarioActual"];
        Usuario user = BD.GetUsuarioByID(idUsuarioActual);
        if (user.Monedas >= 4)
        {
        var figuritas = BD.AbrirSobreN(id);
        TempData["UsuarioActual"] = idUsuarioActual;
        return Json(figuritas);
        }else{
        TempData["UsuarioActual"] = idUsuarioActual;
        Console.WriteLine("a");
        return Json(null);
        }
    }


    public IActionResult Pagina(int id, int equipo)
    {
        int idUsuarioActual = (int)TempData["UsuarioActual"];
        Usuario user = BD.GetUsuarioByID(id);
        ViewBag.Usuario = user;
        ViewBag.JugadoresPaises = BD.SeparaFiguritasEquipo(equipo);
        ViewBag.InventarioPaises = BD.ObtenerInventarioPaises(id, equipo);
        TempData["UsuarioActual"] = idUsuarioActual;
        return View();
    }

    public Sobres AbrirModalSobre(int opcion)
    {
        Sobres sobres;
        if (opcion == 0)
        {
            sobres = BD.ObtenerSobres()[1];
        }
        else
        {
            sobres = BD.ObtenerSobres()[0];
        }
        return sobres;
    }
}
