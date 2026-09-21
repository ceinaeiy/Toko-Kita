<?php
namespace App\Controllers;
use App\Models\ProdukModel;
class Produk extends BaseController
{
    protected $produkModel;
    public function __construct()
    {
        $this->produkModel = new ProdukModel();
    }
    public function index()
    {
        $data = [
            'title' => 'Daftar Produk',
            'produk' => $this->produkModel->findAll()
        ];
        return view('produk/index', $data);
    }
    public function detail($id)
    {
        $produk = $this->produkModel->find($id);
        if (!$produk) {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        }
        $data = [
            'title' => $produk['nama_produk'],
            'produk' => $produk
        ];
        return view('produk/detail', $data);
    }
}