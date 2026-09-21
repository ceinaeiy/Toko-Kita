<?php
namespace App\Models;
use CodeIgniter\Model;
class ProdukModel extends Model
{
    protected $table = 'produk';
    protected $primaryKey = 'id_produk';
    protected $allowedFields = [
        'id_kategori',
        'nama_produk',
        'harga',
        'stok',
        'gambar',
        'deskripsi'
    ];
}