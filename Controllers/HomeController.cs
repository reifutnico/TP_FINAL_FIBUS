using Microsoft.AspNetCore.Mvc;

namespace ProyectoFinal_Album.Controllers;

public class HomeController : Controller
{
    public IActionResult InicioSesion()
    {
        return View();
    }
    
 public IActionResult PaginaInicio()
    {
        return View();
    }
}