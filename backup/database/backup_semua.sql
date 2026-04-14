#
# TABLE STRUCTURE FOR: jabatan
#

DROP TABLE IF EXISTS `jabatan`;

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(128) DEFAULT NULL COMMENT 'opsional',
  `jabatan` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `jabatan` (`id`, `nama`, `jabatan`) VALUES (1, 'Iyan123', 'Kepala Sekolah');
INSERT INTO `jabatan` (`id`, `nama`, `jabatan`) VALUES (2, '', 'Waka Kurikulum');
INSERT INTO `jabatan` (`id`, `nama`, `jabatan`) VALUES (3, '', 'Waka Kesiswaan');
INSERT INTO `jabatan` (`id`, `nama`, `jabatan`) VALUES (4, '', 'Waka Sarana & Prasarana');
INSERT INTO `jabatan` (`id`, `nama`, `jabatan`) VALUES (12, '', 'Bendahara');


#
# TABLE STRUCTURE FOR: disposisi
#

DROP TABLE IF EXISTS `disposisi`;

CREATE TABLE `disposisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sm_id` int(11) NOT NULL,
  `jabatan_id` int(11) DEFAULT NULL,
  `isi` text NOT NULL,
  `batas_waktu` date NOT NULL,
  `sifat_id` int(11) DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sifat_id` (`sifat_id`),
  KEY `jabatan_id` (`jabatan_id`),
  KEY `disposisi_ibfk_1` (`sm_id`),
  CONSTRAINT `disposisi_ibfk_1` FOREIGN KEY (`sm_id`) REFERENCES `surat_masuk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `disposisi` (`id`, `sm_id`, `jabatan_id`, `isi`, `batas_waktu`, `sifat_id`, `catatan`) VALUES (10, 13, 1, '', '2025-03-20', 2, '');


#
# TABLE STRUCTURE FOR: sifat
#

DROP TABLE IF EXISTS `sifat`;

CREATE TABLE `sifat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sifat` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `sifat` (`id`, `sifat`) VALUES (1, 'Segera');
INSERT INTO `sifat` (`id`, `sifat`) VALUES (2, 'Sangat Segera');
INSERT INTO `sifat` (`id`, `sifat`) VALUES (12, 'Sangat Rahasia');


#
# TABLE STRUCTURE FOR: surat_masuk
#

DROP TABLE IF EXISTS `surat_masuk`;

CREATE TABLE `surat_masuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_agenda` varchar(20) DEFAULT NULL,
  `pengirim` varchar(128) DEFAULT NULL,
  `no_surat` varchar(128) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `tgl_surat` date DEFAULT NULL,
  `tgl_diterima` date DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `file` varchar(128) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `surat_masuk` (`id`, `no_agenda`, `pengirim`, `no_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `created_at`, `user_id`) VALUES (13, '001/SM', 'Univesitas Muhamadiyah  Prof Dr Hamka', '1', 'Penelitian Skripsi', '2025-04-29', '2025-07-09', '-', '0d4c6b989834546b81e77a4a7786ebb3.pdf', '2026-03-04 05:55:09', 1);
INSERT INTO `surat_masuk` (`id`, `no_agenda`, `pengirim`, `no_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `created_at`, `user_id`) VALUES (14, '002/SM', 'Pesantren putri islam asyafiiyah', '2', 'Lomba ', '2025-01-05', '2025-07-09', '', 'c7d60953c274e5aae42361d11208f2b7.pdf', '2026-03-04 05:54:40', 1);
INSERT INTO `surat_masuk` (`id`, `no_agenda`, `pengirim`, `no_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `created_at`, `user_id`) VALUES (15, '003/SK', 'Petugas TU', '59', 'Edaran PAS', '2023-03-06', '2023-03-06', '', 'b33a0c0d7ab35ab5ff6c473044e69c11.pdf', '2026-03-07 16:13:20', 1);


#
# TABLE STRUCTURE FOR: surat_keluar
#

DROP TABLE IF EXISTS `surat_keluar`;

CREATE TABLE `surat_keluar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_agenda` varchar(20) NOT NULL,
  `pengirim` varchar(128) NOT NULL,
  `no_surat` varchar(128) NOT NULL,
  `isi` text NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_diterima` date NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `file` varchar(128) DEFAULT NULL,
  `created_at` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `surat_keluar` (`id`, `no_agenda`, `pengirim`, `no_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `created_at`, `user_id`) VALUES (13, '001/SK', 'Petugas TU', '58', 'Edaran PTS', '2022-09-15', '2022-09-15', '', '682e5409b738f4c288a705f6f3dadd35.pdf', '2026-03-03', 1);
INSERT INTO `surat_keluar` (`id`, `no_agenda`, `pengirim`, `no_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `created_at`, `user_id`) VALUES (15, '002/SK', 'Petugas TU', '58', 'Edaran PAS', '2022-11-09', '2022-11-05', '', '7cb50cf54cc138031ca292166444845d.pdf', '2026-03-03', 1);
INSERT INTO `surat_keluar` (`id`, `no_agenda`, `pengirim`, `no_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `created_at`, `user_id`) VALUES (16, '003/SK', 'Petugas TU', '59', 'Edaran PTS', '2023-03-06', '2023-03-06', '', '7fcd111485931eac86b438d2e896f386.pdf', '2026-03-03', 1);
INSERT INTO `surat_keluar` (`id`, `no_agenda`, `pengirim`, `no_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `created_at`, `user_id`) VALUES (22, '004/SK', 'Petugas TU', '59', 'EDARAB', '2023-03-06', '2023-03-06', '', '734c6fbddc8b093be59985683698d236.pdf', '2026-03-07', 1);


#
# TABLE STRUCTURE FOR: user
#

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `role_id` int(11) NOT NULL,
  `date_created` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`, `image`, `role_id`, `date_created`) VALUES (1, 'Akun Admin', 'admin', 'admin@gmail.com', '$2y$10$ugX/PA/OFx/KpRnea3znLOeHZb2PKKnvvsAznNHEMcoAOeOg2d1wK', 'default22.svg', 1, '1735689600');
INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`, `image`, `role_id`, `date_created`) VALUES (3, 'Akun user', 'user1234', 'user@gmail.com', '$2y$10$8tPfe3EuK6ZhhSBVC9MQl.Pw5f8cY48SRu9/8coWwol/W9imWA.o.', 'default.svg', 2, '1735689600');
INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`, `image`, `role_id`, `date_created`) VALUES (16, 'petugas', 'petugas', 'petugas@gmail.com', '$2y$10$XUMxusc1tVcjh0bA3LRyoepw693T1pG9oWydy89ddIW.O3smR50O.', 'default.svg', 15, '1772337898');


#
# TABLE STRUCTURE FOR: user_role
#

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `user_role` (`id`, `role`) VALUES (10, 'Admin');
INSERT INTO `user_role` (`id`, `role`) VALUES (15, 'Petugas ');


#
# TABLE STRUCTURE FOR: user_token
#

DROP TABLE IF EXISTS `user_token`;

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (1, 'admin@gmail.com', '6ylBot453ImnVEAgocB+G8a/TjcwEja+lzd4L/bZUhU=', '1772211405');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (2, 'admin@gmail.com', 'TM8D3KM5t9AHwuCouIQWu31wxnSqDIYkMWlRslNLvj0=', '1772249642');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (3, 'admin@gmail.com', 'd+ftcComB52gqCKoGM6f1Ntu+JXuhdf2iGUVImcaYZs=', '1772249822');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (4, 'admin@gmail.com', '8KvOesWncfiidJVSqeAEN2ha6HtgRpIBl2fXwrFbO9A=', '1772249839');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (5, 'admin@gmail.com', 'TFTiche3ErgGzftXZkZP5xCqLI3GL4pLAUSYNRmwgIk=', '1772249907');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (6, 'admin@gmail.com', 'nA3YVNn2ASv2D1bK9TdajuDLMi/vNcEzMCcUf4mWR18=', '1772250453');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (7, 'admin@gmail.com', 'QB5db7cAO7UfVmU+1oHNwdaZ+bVTbFUDWkTM5lndT8Y=', '1772680317');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (8, 'admin@gmail.com', 'PRUseWbTwaSPvGUF9Mc6AMl0L7IPq1lgrbaf28O2Mn4=', '1772682769');


