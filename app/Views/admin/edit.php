<?= $this->include('layout/header') ?>
<h2 class="mb-4">Edit Produk</h2>
<form action="<?= base_url('admin/update/' . $produk['id_produk']) ?>"
      method="post">
    <div class="mb-3">
        <label class="form-label">Kategori</label>
        <select name="id_kategori" class="form-control">
            <?php foreach ($kategori as $k): ?>
                <option value="<?= $k['id_kategori'] ?>"
                    <?= $k['id_kategori'] == $produk['id_kategori']
                        ? 'selected' : '' ?>>
                    <?= esc($k['nama_kategori']) ?>
                </option>
            <?php endforeach; ?>
        </select>
    </div>
    <div class="mb-3">
        <label class="form-label">Nama Produk</label>
        <input type="text" name="nama_produk"
               class="form-control"
               value="<?= esc($produk['nama_produk']) ?>">
    </div>
    <div class="mb-3">
        <label class="form-label">Harga</label>
        <input type="number" name="harga"
               class="form-control"
               value="<?= $produk['harga'] ?>">
    </div>
    <div class="mb-3">
        <label class="form-label">Stok</label>
        <input type="number" name="stok"
               class="form-control"
               value="<?= $produk['stok'] ?>">
    </div>
    <div class="mb-3">
        <label class="form-label">Gambar</label>
        <input type="text" name="gambar"
               class="form-control"
               value="<?= esc($produk['gambar']) ?>">
    </div>
    <div class="mb-3">
        <label class="form-label">Deskripsi</label>
        <textarea name="deskripsi"
                  class="form-control"
                  rows="5"><?= esc($produk['deskripsi']) ?></textarea>
    </div>
    <button type="submit" class="btn btn-success">Update</button>
     <a href="<?= base_url('admin') ?>"
       class="btn btn-secondary">
        Kembali
    </a>
</form>
<?= $this->include('layout/footer') ?>