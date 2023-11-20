using System.Data.SqlClient;
using Dapper;

namespace tpFinal.Models;

public class BD
{
    private static string _connectionstring=@"Server=DESKTOP-N9T7V8S\SQLEXPRESS;Database=BDAlbum;Trusted_Connection=True;";

    public static bool Login(string Nombre, string Contraseña){
        bool correcto=false;    
        using(SqlConnection db = new SqlConnection(_connectionstring)){
            string sql ="EXEC LoginUsuario @pUsername, @pContraseña";
            correcto=Convert.ToBoolean(db.QueryFirstOrDefault<int>(sql,new{pUsername=Nombre,pContraseña=Contraseña}));
        }
        return correcto;
    }

    public static void Registro(string usuario, string contraseña, string mail){

        using (SqlConnection db= new SqlConnection(_connectionstring)){
            string sql ="EXEC RegistrarseUsuario @u,@c,@e";
            db.Execute(sql, new{u=usuario,c=contraseña,e=mail});
        }
    } 

    public static int CambiarContraseña(string Nombre, string Contraseña)
    {
        int resultado = 0;
        using(SqlConnection db = new SqlConnection(_connectionstring)){
            string sql="EXEC SP_CambiarContraseña @pUsername, @pContraseña";
            resultado = db.QueryFirstOrDefault<int>(sql, new{pUsername=Nombre,pContraseña=Contraseña});
        }
        return resultado;
    }

    public static Usuario GetUsuarioByNombre(string Nombre){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC GetUsuario @user";
            return db.QueryFirstOrDefault<Usuario>(sql, new{user=Nombre});
        }
    }

    public static Usuario GetUsuarioByID(int id){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC GetUsuarioById @user";
            return db.QueryFirstOrDefault<Usuario>(sql, new{user=id});
        }
    }

    public static List<Figuritas> AbrirSobreP(int id){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC AbrirSobre @user";
            return db.Query<Figuritas>(sql, new{user=id}).ToList();
        }
    }
    public static Figuritas AbrirSobreN(int id){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC AbrirSobreNormal @user";
            return db.QueryFirstOrDefault<Figuritas>(sql, new{user=id});
        }
    }

    public static List<Figuritas> ObtenerInventario(int id){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC obtenerInventario @user";
            return db.Query<Figuritas>(sql, new{user=id}).ToList();
        }
    }

    public static List<Figuritas> obtenerFiguritas(){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC obtenerFiguritas";
            return db.Query<Figuritas>(sql).ToList();
        }
    }
    public static void pegarFigurita(int id, int idfigurita){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC obtenerFiguritas @user, @figurita";
            db.Execute(sql, new{user=id, figurita=idfigurita});
        }
    }
}