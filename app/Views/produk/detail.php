<?= $this->include('layout/header') ?>
<div class="row">
    <div class="col-md-6">
        <?php if ($produk['gambar']): ?>
            <img src="<?= base_url('assets/img/' . $produk['gambar']) ?>"
                 class="img-fluid rounded">
        <?php endif; ?>
    </div>
    <div class="col-md-6">
        <h1><?= esc($produk['nama_produk']) ?></h1>
        <h3 class="text-primary">
            Rp <?= number_format($produk['harga'], 0, ',', '.') ?>
        </h3>
        <p><?= esc($produk['deskripsi']) ?></p>
        <p>
            Stok: <strong><?= $produk['stok'] ?></strong>
        </p>
        <button class="btn btn-success">
             Tambah ke Keranjang
        </button>
    </div>
</div>
<?= $this->include('layout/footer') ?>