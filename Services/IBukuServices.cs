using StudentManagementApp.Models;

namespace StudentManagementApp.Services
{
    public interface IBukuServices
    {
        public List<Buku> GetAllBuku();
        public string InsertBuku(Buku buku);
        public string UpdateBuku(Buku buku);
        public string DeleteBuku(int id_buku);
    }

}
