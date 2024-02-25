<div class="container">
    <div class="row">
        <div class="col-5">
            <div class="card">
                <div class="card-body">
                    <h4>Halaman Upload</h4>
                    <?php
                    //ambil data dari <form>
                    $submit = @$_POST['submit'];
                    $fotoid = @$_GET['fotoid'];
                    if ($submit == 'Simpan') {
                        $judul_foto = @$_POST['judul_foto'];
                        $deskripsi_foto = @$_POST['deskripsi_foto'];
                        $nama_file = @$_FILES['namafile']['name'];
                        $tmp_foto = @$_FILES['namafile']['tmp_name'];
                        $tanggal = date('Y-m-d');
                        $album_id = @$_POST['album_id'];
                        $user_id = @$_SESSION['user_id'];
                        if (move_uploaded_file($tmp_foto, 'uploads/' . $nama_file)) {
                            $insert = mysqli_query($conn, "INSERT INTO foto VALUES('','$judul_foto','$deskripsi_foto','$tanggal','$nama_file','$album_id','$user_id')");
                            echo "<script>
                        alert('gambar berhasil disimpan');
                        </script>";
                            echo '<meta http-equiv="refresh" content="0.8; url=?url=upload">';
                        } else {
                            echo "<script>
                        alert('gambar gagal disimpan');
                        </script>";
                            echo '<meta http-equiv="refresh" content="0.8; url=?url=upload">';
                        }
                    } elseif (isset($_GET['edit'])) {
                        if ($submit == "Ubah") {
                            $judul_foto = @$_POST['judul_foto'];
                            $deskripsi_foto = @$_POST['deskripsi_foto'];
                            $nama_file = @$_FILES['namafile']['name'];
                            $tmp_foto = @$_FILES['namafile']['tmp_name'];
                            $tanggal = date('Y-m-d');
                            $album_id = @$_POST['album_id'];
                            $user_id = @$_SESSION['user_id'];
                            if (strlen($nama_file) == 0) {
                                $update = mysqli_query($conn, "UPDATE foto SET JudulFoto='$judul_foto', DeskripsiFoto='$deskripsi_foto', TanggalUnggah='$tanggal', AlbumID='$album_id' WHERE FotoID='$fotoid'");
                                if ($update) {
                                    echo "<script>
                        alert('gambar berhasil diubah');
                        </script>";
                                    echo '<meta http-equiv="refresh" content="0.8; url=?url=upload">';
                                } else {
                                    echo "<script>
                        alert('gambar gagal diubah');
                        </script>";
                                    echo '<meta http-equiv="refresh" content="0.8; url=?url=upload">';
                                }
                            } else {
                                if (move_uploaded_file($tmp_foto, "uploads/" . $nama_file)) {
                                    $update = mysqli_query($conn, "UPDATE foto SET JudulFoto='$judul_foto', DeskripsiFoto='$deskripsi_foto', NamaFile='$nama_file', TanggalUnggah='$tanggal', AlbumID='$album_id' WHERE FotoID='$fotoid'");
                                    if ($update) {
                                        echo "<script>
                        alert('gambar berhasil diubah');
                        </script>";
                                        echo '<meta http-equiv="refresh" content="0.8; url=?url=upload">';
                                    } else {
                                        echo "<script>
                        alert('gambar gagal diubah');
                        </script>";
                                        echo '<meta http-equiv="refresh" content="0.8; url=?url=upload">';
                                    }
                                }
                            }
                        }
                    } elseif (isset($_GET['hapus'])) {
                        $delete = mysqli_query($conn, "DELETE FROM foto WHERE FotoID='$fotoid'");
                        if ($delete) {
                            echo "<script>
                        alert('gambar berhasil dihapus');
                        </script>";
                            echo '<meta http-equiv="refresh" content="0.8; url=?url=upload">';
                        } else {
                            echo "<script>
                        alert('gambar gagal dihapus');
                        </script>";
                            echo '<meta http-equiv="refresh" content="0.8; url=?url=upload">';
                        }
                    }
                    //mencari data album
                    $album = mysqli_query($conn, "SELECT * FROM album WHERE UserID='$_SESSION[user_id]'");
                    $val = mysqli_fetch_array(mysqli_query($conn, "SELECT * FROM foto WHERE FotoID='$fotoid'"));
                    ?>
                    <?php if (!isset($_GET['edit'])) : ?>
                        <form action="?url=upload" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>Judul Foto</label>
                                <input type="text" class="form-control" required name="judul_foto">
                            </div>
                            <div class="form-group">
                                <label>Deskripsi Foto</label>
                                <textarea name="deskripsi_foto" class="form-control" required cols="30" rows="5"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Pilih Gambar</label>
                                <input type="file" name="namafile" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Pilih Album</label>
                                <select name="album_id" class="form-select">
                                    <?php foreach ($album as $albums) : ?>
                                        <option value="<?= $albums['AlbumID'] ?>"><?= $albums['NamaAlbum'] ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <input type="submit" value="Simpan" name="submit" class="btn btn-secondary my-3">
                        </form>
                    <?php elseif (isset($_GET['edit'])) : ?>
                        <form action="?url=upload&&edit&&fotoid=<?= $val['FotoID'] ?>" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>Judul Foto</label>
                                <input type="text" class="form-control" value="<?= $val['JudulFoto'] ?>" required name="judul_foto">
                            </div>
                            <div class="form-group">
                                <label>Deskripsi Foto</label>
                                <textarea name="deskripsi_foto" class="form-control" required cols="30" rows="5"><?= $val['DeskripsiFoto'] ?></textarea>
                            </div>
                            <div class="form-group">
                                <label>Pilih Gambar</label>
                                <input type="file" name="namafile" class="form-control">
                                <small class="text-danger">File Harus Berupa: *.jpg, *.png *.gif</small>
                            </div>
                            <div class="form-group">
                                <label>Pilih Album</label>
                                <select name="album_id" class="form-select">
                                    <?php foreach ($album as $albums) : ?>
                                        <?php if ($albums['AlbumID'] == $val['AlbumID']) : ?>
                                            <option value="<?= $albums['AlbumID'] ?>" selected><?= $albums['NamaAlbum'] ?></option>
                                        <?php else : ?>
                                            <option value="<?= $albums['AlbumID'] ?>"><?= $albums['NamaAlbum'] ?></option>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <input type="submit" value="Ubah" name="submit" class="btn btn-danger my-3">
                        </form>
                    <?php endif; ?>
                </div>
            </div>
        </div>
        <div class="col-7">
            <div class="row">
                <?php
                $fotos = mysqli_query($conn, "SELECT * FROM foto WHERE UserID='" . @$_SESSION['user_id'] . "'");
                foreach ($fotos as $foto) :
                ?>
                    <div class="col-6 col-md-4 col-lg-3 mb-4">
                        <div class="card">
                            <img src="uploads/<?= $foto['NamaFile'] ?>" class="object-fit-cover" style="aspect-ratio: 16/9;">
                            <div class="card-body">
                                <p class="small"><?= $foto['JudulFoto'] ?></p>
                                <a href="?url=upload&&edit&&fotoid=<?= $foto['FotoID'] ?>" class="btn btn-sm btn-warning">Edit</a>
                                <a href="?url=upload&&hapus&&fotoid=<?= $foto['FotoID'] ?>" class="btn btn-sm btn-danger">Hapus</a>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</div>