<?= $this->include('layout/header') ?>
<h2 class="mb-4">Tambah Produk</h2>
<form action="<?= base_url('admin/simpan') ?>" method="post">
    <div class="mb-3">
        <label class="form-label">Kategori</label>
        <select name="id_kategori" class="form-control" required>
            <option value="">-- Pilih Kategori --</option>
            <?php foreach ($kategori as $k): ?>
                <option value="<?= $k['id_kategori'] ?>">
                    <?= esc($k['nama_kategori']) ?>
                </option>
            <?php endforeach; ?>
        </select>
    </div>
    <div class="mb-3">
        <label class="form-label">Nama Produk</label>
        <input type="text" name="nama_produk"
               class="form-control" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Harga</label>
        <input type="number" name="harga"
               class="form-control" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Stok</label>
        <input type="number" name="stok"
               class="form-control" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Nama File Gambar</label>
        <input type="text" name="gambar" class="form-control" placeholder="contoh: laptop.jpg">
    </div>
    <div class="mb-3">
        <label class="form-label">Deskripsi</label>
        <textarea name="deskripsi" class="form-control" rows="5"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Simpan</button>
    <a href="<?= base_url('admin') ?>"
       class="btn btn-secondary">
        Kembali
    </a>
</form>
<?= $this->include('layout/footer') ?>