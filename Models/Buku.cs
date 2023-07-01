namespace StudentManagementApp.Models
{
    public class Buku
    {
        public int id_buku { get; set; }
        public string kode { get; set; }
        public string judul { get; set; }
        public string tahun { get; set; }
        public string isi { get; set; }
        public string pengarang { get; set; }
        public string penerbit { get; set; }
        public int jumlah { get; set; }
        public string tanggal { get; set; }
        public string Response { get; set; }
    }
}
