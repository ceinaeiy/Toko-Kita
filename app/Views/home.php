<?= $this->include('layout/header') ?>
<div class="p-5 mb-4 bg-light rounded-3">
    <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">Selamat Datang di Toko Kita</h1>
        <p class="col-md-8 fs-5">
            Temukan berbagai produk berkualitas dengan harga terbaik.
        </p>
        <a href="<?= base_url('produk') ?>" class="btn btn-primary btn-lg">
            Lihat Produk
        </a>
    </div>
</div>
<h2 class="mb-4">Produk Terbaru</h2>
<div class="row">
<?php foreach ($produk as $p): ?>
    <div class="col-md-3 mb-4">
        <div class="card h-100 shadow-sm">
            <?php if ($p['gambar']): ?>
                <img src="<?= base_url('assets/img/' . $p['gambar']) ?>"
                     class="card-img-top"
                     style="height:200px;object-fit:cover;">
            <?php endif; ?>
            <div class="card-body">
                <h5 class="card-title"><?= esc($p['nama_produk']) ?></h5>
                <p class="text-primary fw-bold">
                    Rp <?= number_format($p['harga'], 0, ',', '.') ?>
                </p>
                <a href="<?= base_url('produk/detail/' . $p['id_produk']) ?>"
                   class="btn btn-dark">
                    Detail
                </a>
            </div>
        </div>
    </div>
<?php endforeach; ?>
</div>
<?= $this->include('layout/footer') ?>