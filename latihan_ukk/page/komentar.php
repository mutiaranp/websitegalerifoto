<?php 
$foto_id=@$_GET["id"];
$user_id=@$_SESSION["user_id"];
$komen_id=@$_GET['komentar_id'];
$cek=mysqli_num_rows(mysqli_query($conn, "SELECT * FROM komentar WHERE UserID='$user_id' AND FotoID='$foto_id' AND KomentarID='$komen_id'"));
if ($cek > 0) {
   $delete=mysqli_query($conn, "DELETE FROM komentar WHERE KomentarID='$komen_id'");
   echo '<script>alert("Anda berhasil menghapus komentar ini");</script>';
   echo '<meta http-equiv="refresh" content="0; url=?url=detail&&id='.@$foto_id.'">';
} else {
   // User is not allowed to delete the comment
   $alert='Gagal hapus komentar';
   echo '<script>alert("Anda tidak berhak menghapus komentar ini");</script>';
   echo '<meta http-equiv="refresh" content="0; url=?url=detail&&id='.@$foto_id.'">';
}
?>