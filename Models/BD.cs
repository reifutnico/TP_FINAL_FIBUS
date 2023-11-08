using System.Data.SqlClient;
using Dapper;

public class BD
{
    private static string _connectionstring=@"Server= .;Database=BDAlbum;Trusted_Connection=True;";

    public static bool Login(string Nombre, string Contraseña){
        bool correcto=false;    
        using(SqlConnection db = new SqlConnection(_connectionstring)){
            string sql ="EXEC LoginUsuario @pUsername, @pContraseña";
            correcto=Convert.ToBoolean(db.QueryFirstOrDefault<int>(sql,new{pUsername=Nombre,pContraseña=Contraseña}));
        }
        return correcto;
    }

    public static void Registro(string us, string con, string em){

        using (SqlConnection db= new SqlConnection(_connectionstring)){
            string sql ="EXEC RegistrarseUsuario @u,@c,@e";
            db.Execute(sql, new{u=us,c=con,e=em});
        }
    } 

        public static int CambiarContraseña(string Nombre, string Contraseña)
        {
        int resultado=0;
        using(SqlConnection db = new SqlConnection(_connectionstring)){
            string sql="EXEC SP_CambiarContraseña @pUsername, @pContraseña";
            resultado=db.QueryFirstOrDefault<int>(sql, new{pUsername=Nombre,pContraseña=Contraseña});
        }
        return resultado;
    }

    public static Usuario GetUsuario(string Nombre){

        Usuario user= new Usuario();
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC GetUsuario @user";
            user=db.QueryFirstOrDefault<Usuario>(sql, new{user=Nombre});
        }
        return user;
    }

  /*      
public static Figuritas figuritasAleatoria()
{
    using (SqlConnection db = new SqlConnection(_connectionstring))
    {
        string sql = "SELECT TOP 1 * FROM Figuritas ORDER BY NEWID()";
        Figuritas figu = db.QueryFirstOrDefault<Figuritas>(sql);
        return figu;
    }
}

*/
    
}