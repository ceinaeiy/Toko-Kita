<?= $this->include('layout/header') ?>
<div class="d-flex justify-content-between align-items-center mb-4">
    <h2>Data Produk</h2>
    <a href="<?= base_url('admin/tambah') ?>"
       class="btn btn-primary">
        + Tambah Produk
    </a>
</div>
<div class="table-responsive">
<table class="table table-bordered table-striped">
    <thead class="table-dark">
        <tr>
            <th>No</th>
            <th>Produk</th>
            <th>Kategori</th>
            <th>Harga</th>
            <th>Stok</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
    <?php $no = 1; ?>
    <?php foreach ($produk as $p): ?>
        <tr>
            <td><?= $no++ ?></td>
            <td><?= esc($p['nama_produk']) ?></td>
            <td><?= esc($p['nama_kategori']) ?></td>
            <td>Rp <?= number_format($p['harga'], 0, ',', '.') ?></td>
            <td><?= $p['stok'] ?></td>
            <td>
                <a href="<?= base_url('admin/edit/' . $p['id_produk']) ?>"
                   class="btn btn-warning btn-sm">
                    Edit
                </a>
                <a href="<?= base_url('admin/hapus/' . $p['id_produk']) ?>"
                   class="btn btn-danger btn-sm"
                   onclick="return confirm('Yakin ingin menghapus produk ini?')">
                    Hapus
                </a>
            </td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>
</div>
<?= $this->include('layout/footer') ?>