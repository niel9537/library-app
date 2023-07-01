using Dapper;
using StudentManagementApp.Models;
using System.Data;
using System.Data.SqlClient;

namespace StudentManagementApp.Services
{
    public class BukuServices : IBukuServices
    {
        private readonly IConfiguration _configuration;

        public BukuServices(IConfiguration configuration)
        {
            _configuration = configuration;
            ConnectionString = _configuration.GetConnectionString("DBConnection");
            provideName = "System.Data.SqlClient";

        }

        public string ConnectionString { get;}
        public string provideName { get; }
        public IDbConnection Connection
        {
            get { return new SqlConnection(ConnectionString); }
        }

        public string DeleteBuku(int id_buku)
        {
            string result = "";
            try
            {
                using (IDbConnection dbConnection = Connection)
                {
                    dbConnection.Open();
                    var bk = dbConnection.Query<Buku>(
                        "DeleteBuku",
                        new { id_buku = id_buku },
                        commandType: CommandType.StoredProcedure);
                    if (bk != null && bk.FirstOrDefault().Response == "Data Buku Berhasil Dihapus")
                    {
                        result = "Data Buku Berhasil Dihapus ";
                    }
                    dbConnection.Close();
                    return result;
                }
            }
            catch (Exception ex)
            {
                string errorMsg = ex.Message;
                return errorMsg;
            }
        }

        public List<Buku> GetAllBuku()
        {
            List<Buku> bukus = new List<Buku>();
            try
            {
                using (IDbConnection dbConnection = Connection)
                {
                    dbConnection.Open();
                    bukus = dbConnection.Query<Buku>("GetAllBuku", commandType: CommandType.StoredProcedure).ToList();
                    dbConnection.Close();
                    return bukus;
                }
            }catch (Exception ex)
            {
                string errorMsg = ex.Message;
                return bukus;
            }
        }

        public string InsertBuku(Buku buku)
        {

            string result = "";
            try
            {
                using (IDbConnection dbConnection = Connection)
                {
                    dbConnection.Open();
                    var bk = dbConnection.Query<Buku>(
                        "InsertBuku",
                        new { kode = buku.kode, judul = buku.judul,tahun = buku.tahun,isi=buku.isi,pengarang=buku.pengarang,penerbit=buku.penerbit,jumlah=buku.jumlah }, 
                        commandType: CommandType.StoredProcedure);
                        if (bk != null && bk.FirstOrDefault().Response == "Data Buku Berhasil Ditambahkan")
                        {
                            result = "Data Buku Berhasil Ditambahkan";
                        }
                        dbConnection.Close();
                        return result;
                }
            }
            catch (Exception ex)
            {
                string errorMsg = ex.Message;
                return errorMsg;
            }
        }

        public string UpdateBuku(Buku buku)
        {
            string result = "";
            try
            {
                using (IDbConnection dbConnection = Connection)
                {
                    dbConnection.Open();
                    var bk = dbConnection.Query<Buku>(
                        "UpdateBuku",
                        new { kode = buku.kode, judul = buku.judul, tahun = buku.tahun, isi = buku.isi, pengarang = buku.pengarang, penerbit = buku.penerbit, jumlah = buku.jumlah, id_buku = buku.id_buku },
                        commandType: CommandType.StoredProcedure);
                    if (bk != null && bk.FirstOrDefault().Response == "Data Buku Berhasil Diperbaharui")
                    {
                        result = "Data Buku Berhasil Diperbaharui ";
                    }
                    dbConnection.Close();
                    return result;
                }
            }
            catch (Exception ex)
            {
                string errorMsg = ex.Message;
                return errorMsg;
            }
        }
    }
}
