<?php
include "koneksi.php";

$Username = $_POST['Username'];
$Password = md5($_POST['Password']);

$cek=mysqli_query($conn, "SELECT * FROM user WHERE Username='$Username' AND Password='$Password'");

$jml=mysqli_num_rows($cek);

if ($jml>0){
   # code...
   echo "<script>
   alert('Login berhasil');
   location.href='index.php';
   </script>";
}else{
   echo "<script>
   alert('username atau password salah!');
   location.href='login.php';
   </script>";
}
?>