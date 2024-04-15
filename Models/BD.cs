using System.Data.SqlClient;
using Dapper;

namespace tpFinal.Models;

public class BD
{
    private static string _connectionstring=@"Server=.;Database=BDAlbum;Trusted_Connection=True;";

    public static bool Login(string Nombre, string Contraseña){
        bool correcto=false;    
        using(SqlConnection db = new SqlConnection(_connectionstring)){
            string sql ="EXEC LoginUsuario @pUsername, @pContraseña";
            correcto=Convert.ToBoolean(db.QueryFirstOrDefault<int>(sql,new{pUsername=Nombre,pContraseña=Contraseña}));
        }
        return correcto;
    }

    public static int Registro(string usuario, string contraseña, string confirmarContraseña, string mail){
        int num=0;    
        using (SqlConnection db= new SqlConnection(_connectionstring)){
            string sql ="EXEC RegistrarseUsuario @u,@c,@ce,@e";
            num=db.QueryFirstOrDefault<int>(sql, new{u=usuario,c=contraseña,ce=confirmarContraseña,e=mail});
        }
            return num;
    } 

    public static int CambiarContraseña(string usuario, string contraseña, string nuevacontraseña, string confirmarContraseña)
    {
        int num = 0;
        using(SqlConnection db = new SqlConnection(_connectionstring)){
            string sql="EXEC SP_CambiarContraseña @pUsername, @pContraseña, @pNuevacontraseña, @pConfirmarContra";
            num = db.QueryFirstOrDefault<int>(sql, new{pUsername=usuario,pContraseña=contraseña, pNuevacontraseña=nuevacontraseña, pConfirmarContra=confirmarContraseña});
        }
        return num;
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
            string sql = "EXEC AbrirSobrePremium @user";
            return db.Query<Figuritas>(sql, new{user=id}).ToList();
        }
    }
    public static List<Figuritas>  AbrirSobreN(int id){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC AbrirSobreNormal @user";
            return db.Query<Figuritas>(sql, new{user=id}).ToList();
        }
    }

    public static List<Figuritas> ObtenerInventario(int id){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC obtenerInventario @user";
            return db.Query<Figuritas>(sql, new{user=id}).ToList();
        }
    }

    public static List<Figuritas> SeparaFiguritasEquipo(int equipo){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC SP_SepararFiguritasPorEquipo @pEquipo";
            return db.Query<Figuritas>(sql, new{pEquipo=equipo}).ToList();
        }
    }

    public static List<Figuritas> ObtenerInventarioPaises(int id, int equipo){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC ObtenerInventarioxPaises @user, @pEquipo";
            return db.Query<Figuritas>(sql, new{user=id,pEquipo=equipo}).ToList();
        }
    }

    public static List<Sobres> ObtenerSobres(){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC ObtenerSobres";
            return db.Query<Sobres>(sql).ToList();
        }
    }

        public static List<Figuritas> ObtenerRepes(int id){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC SP_Repetidas @user";
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
// PARA VENDER LA FIGURITA
    public static void VenderFigurita(int idUsuario,int precio, int idFigurita){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "EXEC SP_Vender @zprecio, @zidUsuario, @zidFigu";
            db.Execute(sql, new{zprecio=precio,zidUsuario=idUsuario,zidFigu=idFigurita});
        }
    }


    public static void CambiarMonedas(int idUsuario,int monedas){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "update Usuario set Monedas = @m where Usuario.IdUsuario = @id";
            db.Execute(sql, new{m=monedas,id=idUsuario});
        }
    }

        public static void CambiarRepetidas(int idInventario,int idFigu){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
        string sql = @"
            DELETE t
            FROM (
                SELECT IdInventario, IdFigurita,
                    ROW_NUMBER() OVER(PARTITION BY IdFigurita ORDER BY (SELECT NULL)) AS RowNum
                FROM InventarioXFigus
                WHERE IdInventario = @idI
                    AND IdFigurita = @idF
            ) AS t
            WHERE t.RowNum > 1";
            db.Execute(sql, new{idI=idInventario,idF=idFigu});
        }
    }
        public static int ObtenerIdInventario(int idUsuario){
        using (SqlConnection db=new SqlConnection(_connectionstring)){
            string sql = "select IdInventario from Inventario where IdUsuario = @idU";
            return db.QueryFirstOrDefault<int>(sql, new{idU=idUsuario});
        }
    }
    
    
    }
