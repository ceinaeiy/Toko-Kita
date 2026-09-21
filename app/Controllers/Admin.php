<?php
namespace App\Controllers;
use App\Models\ProdukModel;
use App\Models\KategoriModel;
class Admin extends BaseController
{
    protected $produkModel;
    protected $kategoriModel;
    public function __construct()
    {
        $this->produkModel = new ProdukModel();
        $this->kategoriModel = new KategoriModel();
    }
    public function index()
    {
        $data = [
            'title' => 'Admin Produk',
            'produk' => $this->produkModel
                ->select('produk.*, kategori.nama_kategori')
                ->join(
                    'kategori',
                    'kategori.id_kategori = produk.id_kategori'
                )
                ->findAll()
        ];
        return view('admin/index', $data);
    }
    public function tambah()
    {
        $data = [
            'title' => 'Tambah Produk',
            'kategori' => $this->kategoriModel->findAll()
        ];
        return view('admin/tambah', $data);
    }
    public function simpan()
    {
        $this->produkModel->save([
            'id_kategori' => $this->request->getPost('id_kategori'),
            'nama_produk' => $this->request->getPost('nama_produk'),
            'harga'       => $this->request->getPost('harga'),
            'stok'        => $this->request->getPost('stok'),
            'gambar'      => $this->request->getPost('gambar'),
            'deskripsi'   => $this->request->getPost('deskripsi')
        ]);
        return redirect()->to('/admin');
    }
    public function edit($id)
    {
        $data = [
            'title' => 'Edit Produk',
            'produk' => $this->produkModel->find($id),
            'kategori' => $this->kategoriModel->findAll()
        ];
        return view('admin/edit', $data);
    }
    public function update($id)
    {
        $this->produkModel->update($id, [
            'id_kategori' => $this->request->getPost('id_kategori'),
            'nama_produk' => $this->request->getPost('nama_produk'),
            'harga'       => $this->request->getPost('harga'),
            'stok'        => $this->request->getPost('stok'),
            'gambar'      => $this->request->getPost('gambar'),
            'deskripsi'   => $this->request->getPost('deskripsi')
        ]);
        return redirect()->to('/admin');
    }
    public function hapus($id)
    {
         $this->produkModel->delete($id);
        return redirect()->to('/admin');
    }
}