-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Feb 2024 pada 08.34
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `latihan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `AlbumID` int(11) NOT NULL,
  `NamaAlbum` varchar(255) NOT NULL,
  `Deskripsi` text NOT NULL,
  `TanggalDibuat` date NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`AlbumID`, `NamaAlbum`, `Deskripsi`, `TanggalDibuat`, `UserID`) VALUES
(10, 'Muti', 'anyeongâ™¡', '2024-02-21', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `foto`
--

CREATE TABLE `foto` (
  `FotoID` int(11) NOT NULL,
  `JudulFoto` varchar(255) NOT NULL,
  `DeskripsiFoto` text NOT NULL,
  `TanggalUnggah` date NOT NULL,
  `NamaFile` varchar(255) NOT NULL,
  `AlbumID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `foto`
--

INSERT INTO `foto` (`FotoID`, `JudulFoto`, `DeskripsiFoto`, `TanggalUnggah`, `NamaFile`, `AlbumID`, `UserID`) VALUES
(12, 'Raja ampat', 'Kepulauan Raja Ampat berada di bagian paling barat Papua dan membentang di area seluas kurang lebih 4,6 juta hektar.\r\nAda dua opsi transportasi yang bisa digunakan yakni melalui jalur udara dan laut.', '2024-02-21', 'raja.jpg', 10, 8),
(13, 'Bukit jerit', 'Ketanggung, Pasir, Kec. Ayah, Kabupaten Kebumen, Jawa Tengah', '2024-02-21', 'bukit jerit.jpg', 10, 8),
(14, 'Pantai Pink', 'Pantai Tangsi merupakan pantai yang terletak di desa Sekaroh, kecamatan Jerowaru, Kabupaten Lombok Timur. Pantai ini dikenal dengan sebutan Pantai Pink dari Pulau Lombok.', '2024-02-21', 'pantai pink.jpg', 10, 8),
(15, 'Pantai ora', 'Pantai Ora beradi di Jl. Kabupaten, Kec. Seram Utara, Kabupaten Maluku Tengah, Maluku.\r\n', '2024-02-21', 'pantai ora.jpg', 10, 8),
(16, 'Pantai ulun danu', 'Berada di Danau Beratan, Candikuning, Kec. Baturiti, Kabupaten Tabanan, Bali 82191\r\n', '2024-02-21', 'pantai ulun.jpg', 10, 8),
(17, 'Padar Island', 'Pulau Padar Labuan Bajo terletak di Kecamatan Komodo, Kabupaten Manggarai Barat, Provinsi Nusa Tenggara Timur (NTT). Pulau Padar merupakan salah satu pulau yang terdapat di Taman Nasional Komodo', '2024-02-21', 'padar island.jpg', 10, 8),
(18, 'Pantai kelingking', 'Bunga Mekar, Kec. Nusa Penida, Kabupaten Klungkung, Bali 80771', '2024-02-21', 'pantai kelingking.jpeg', 10, 8),
(19, 'Pantai Tenggiri', 'Pantai Parai Tenggiri terletak di Jl. Matras Desa Sinar Baru, Kecamatan Sungailiat, Kabupaten Bangka Belitung, Kepulauan Bangka Belitung Tepatnya berada di Desa Sinar Baru yang kira-kira berjarak 30 kilometer di sebelah utara kota Pangkalpinang.', '2024-02-21', 'pantai tenggiri.jpg', 10, 8),
(20, 'Pantai Gili Trawangan', 'Gili Trawangan terletak di Desa Gili Indah, Kecamatan Pemenang, Kabupaten Lombok Utara (KLU) Nusa Tenggara Barat. Trawangan termasuk salah satu kawasan strategis provinsi (KSP), bersamaan dengan Gili Meno dan Gili Air, atau yang disebut juga Pesona Gili Tramena (Trawangan, Meno dan Air).', '2024-02-21', 'Gili Trawangan, Lombok, NTB.jpg', 10, 8),
(21, 'Pulau weh', 'Pulau Weh terletak di bagian utara daratan Aceh. Pulau ini merupakan salah satu dari 111 pulau kecil terluar Negara Republik Indonesia yang terletak di Laut Andaman, Utara Aceh.', '2024-02-21', 'weh.jpg', 10, 8),
(22, 'Pantai Klayar', 'Pantai Klayar terletak di Pacitan, sebuah sisi selatan Jawa Timur dan berbatasan dengan Wonogiri di Jawa Tengah tepatnya yaitu berada di Desa Sendang, Kecamatan Donorojo, Kabupaten Pacitan sekitar 40 km ke arah barat dari Kota Pacitan.', '2024-02-21', 'pantai klayar.jpg', 10, 8),
(23, 'Pulau pamuma', 'Pantai Papuma terletak di Desa Lolejer, Kecamatan Wuluhan, Jember, Jawa Timur. Pantai Papuma juga dikenal sebagai Pantai Tanjung Papuma karena letaknya menjorok ke laut yang disebut dengan tanjung.', '2024-02-21', 'pulau pamuma.jpg', 10, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `KomentarID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `IsiKomentar` text NOT NULL,
  `TanggalKomentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `komentar`
--

INSERT INTO `komentar` (`KomentarID`, `FotoID`, `UserID`, `IsiKomentar`, `TanggalKomentar`) VALUES
(9, 8, 4, 'haii', '2024-02-15'),
(10, 8, 4, 'p', '2024-02-15'),
(11, 8, 4, 'helloooo', '2024-02-16'),
(12, 8, 4, 'helloooo', '2024-02-16'),
(13, 8, 4, 'lucunya', '2024-02-17'),
(14, 8, 4, 'lucunya', '2024-02-17'),
(15, 8, 4, 'haii', '2024-02-17'),
(16, 8, 4, 'sayy', '2024-02-17'),
(17, 8, 4, 'g', '2024-02-17'),
(18, 8, 4, 'hello', '2024-02-17'),
(19, 10, 4, 'indah sekaliii', '2024-02-17'),
(20, 10, 4, 'woow', '2024-02-17'),
(21, 10, 4, 'lucunya', '2024-02-17'),
(22, 11, 4, 'kawai', '2024-02-17'),
(24, 11, 5, 'syantull', '2024-02-20'),
(25, 11, 5, 'syantull', '2024-02-20'),
(26, 12, 11, 'wow IMPIANKUU KESITUUU', '2024-02-21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `likefoto`
--

CREATE TABLE `likefoto` (
  `LikeID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TanggalLIke` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `likefoto`
--

INSERT INTO `likefoto` (`LikeID`, `FotoID`, `UserID`, `TanggalLIke`) VALUES
(34, 9, 4, '2024-02-17'),
(36, 8, 4, '2024-02-17'),
(38, 10, 4, '2024-02-17'),
(39, 11, 4, '2024-02-17'),
(40, 12, 5, '2024-02-19'),
(42, 11, 5, '2024-02-20'),
(43, 12, 8, '2024-02-21'),
(44, 20, 8, '2024-02-21'),
(45, 12, 11, '2024-02-21'),
(46, 22, 11, '2024-02-21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NamaLengkap` varchar(255) NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `NamaLengkap`, `Alamat`) VALUES
(4, 'admin', 'c20ad4d76fe97759aa27a0c99bff6710', 'asiap@gmail.com', 'mutiii', 'sssss'),
(5, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', 'admin', 'carik'),
(6, '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', ''),
(7, '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', ''),
(8, 'muti', '202cb962ac59075b964b07152d234b70', 'muti@gmail.com', 'mutiii', 'korea'),
(9, 'ara', '202cb962ac59075b964b07152d234b70', 'saya@gmail.com', 'anya', 'korea'),
(10, 'muti', '202cb962ac59075b964b07152d234b70', 'muti@gmail.com', 'mutii', 'korea'),
(11, 'anya', '202cb962ac59075b964b07152d234b70', 'anya@gmail.com', 'anyaa', 'jepang');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`AlbumID`);

--
-- Indeks untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`FotoID`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`KomentarID`);

--
-- Indeks untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD PRIMARY KEY (`LikeID`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `AlbumID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `foto`
--
ALTER TABLE `foto`
  MODIFY `FotoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `KomentarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  MODIFY `LikeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
