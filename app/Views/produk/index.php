<?= $this->include('layout/header') ?>
<h2 class="mb-4">Semua Produk</h2>
<div class="row">
<?php foreach ($produk as $p): ?>
    <div class="col-md-4 mb-4">
        <div class="card h-100 shadow-sm">
            <?php if ($p['gambar']): ?>
                <img src="<?= base_url('assets/img/' . $p['gambar']) ?>"
                     class="card-img-top"
                     style="height:220px;object-fit:cover;">
            <?php endif; ?>
             <div class="card-body">
                <h5><?= esc($p['nama_produk']) ?></h5>
                <p><?= esc($p['deskripsi']) ?></p>
                <h5 class="text-primary">
                    Rp <?= number_format($p['harga'], 0, ',', '.') ?>
                </h5>
                <p>Stok: <?= $p['stok'] ?></p>
                <a href="<?= base_url('produk/detail/' . $p['id_produk']) ?>"
                   class="btn btn-primary">
                    Lihat Detail
                </a>
            </div>
        </div>
    </div>
<?php endforeach; ?>
</div>
<?= $this->include('layout/footer') ?>