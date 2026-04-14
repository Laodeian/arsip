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
  CONSTRAINT `disposisi_ibfk_2` FOREIGN KEY (`sifat_id`) REFERENCES `sifat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `disposisi_ibfk_3` FOREIGN KEY (`jabatan_id`) REFERENCES `jabatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `disposisi_ibfk_4` FOREIGN KEY (`sm_id`) REFERENCES `surat_masuk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `disposisi` (`id`, `sm_id`, `jabatan_id`, `isi`, `batas_waktu`, `sifat_id`, `catatan`) VALUES (4, 12, 1, 'Coba tambah data disposisi', '2021-05-17', 2, 'oke');
INSERT INTO `disposisi` (`id`, `sm_id`, `jabatan_id`, `isi`, `batas_waktu`, `sifat_id`, `catatan`) VALUES (8, 11, 1, 'hjjkgjkg', '2025-11-06', 2, 'm,bjbklb');
INSERT INTO `disposisi` (`id`, `sm_id`, `jabatan_id`, `isi`, `batas_waktu`, `sifat_id`, `catatan`) VALUES (9, 14, 3, 'ddfvfvf', '2025-12-26', 2, 'csxzz');
INSERT INTO `disposisi` (`id`, `sm_id`, `jabatan_id`, `isi`, `batas_waktu`, `sifat_id`, `catatan`) VALUES (10, 11, 3, 'ishdidh', '2026-02-24', 2, 'jbsjbkjbdk');


#
# TABLE STRUCTURE FOR: jabatan
#

DROP TABLE IF EXISTS `jabatan`;

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(128) DEFAULT NULL COMMENT 'opsional',
  `jabatan` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `jabatan` (`id`, `nama`, `jabatan`) VALUES (1, '', 'Kepala Sekolah');
INSERT INTO `jabatan` (`id`, `nama`, `jabatan`) VALUES (2, '', 'Waka Kurikulum');
INSERT INTO `jabatan` (`id`, `nama`, `jabatan`) VALUES (3, '', 'Waka Kesiswaan');
INSERT INTO `jabatan` (`id`, `nama`, `jabatan`) VALUES (4, '', 'Waka Sarana & Prasarana');
INSERT INTO `jabatan` (`id`, `nama`, `jabatan`) VALUES (5, '', 'Waka Humas');
INSERT INTO `jabatan` (`id`, `nama`, `jabatan`) VALUES (6, '', 'Bendahara');


#
# TABLE STRUCTURE FOR: sifat
#

DROP TABLE IF EXISTS `sifat`;

CREATE TABLE `sifat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sifat` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `sifat` (`id`, `sifat`) VALUES (1, 'Segera');
INSERT INTO `sifat` (`id`, `sifat`) VALUES (2, 'Sangat Segera');
INSERT INTO `sifat` (`id`, `sifat`) VALUES (11, 'Rahasia');


#
# TABLE STRUCTURE FOR: surat_keluar
#

DROP TABLE IF EXISTS `surat_keluar`;

CREATE TABLE `surat_keluar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_agenda` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `surat_keluar` (`id`, `no_agenda`, `pengirim`, `no_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `created_at`, `user_id`) VALUES (12, 2, 'Skuy Ngoding', 'XVII.10', 'Tambah data surat keluar', '2021-05-01', '2021-05-02', '', '21ecadb60410aff85789914d3ad7ef14.pdf', '2021-05-11', 1);


#
# TABLE STRUCTURE FOR: surat_masuk
#

DROP TABLE IF EXISTS `surat_masuk`;

CREATE TABLE `surat_masuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_agenda` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `surat_masuk` (`id`, `no_agenda`, `pengirim`, `no_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `created_at`, `user_id`) VALUES (11, 1, 'skuy service', 'ix', 'lorem ipsum. ', '2021-01-01', '2021-02-01', '', '78f6cc35280ff154691db5ba0a212bdc.pdf', '2021-05-16 19:47:08', 1);
INSERT INTO `surat_masuk` (`id`, `no_agenda`, `pengirim`, `no_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `created_at`, `user_id`) VALUES (12, 3, 'coba dua', 'ix', 'coba', '2021-02-10', '2021-02-11', '', 'bf194667d45be9caf3124fd5bb49f322.pdf', '2021-05-16 19:53:17', 1);
INSERT INTO `surat_masuk` (`id`, `no_agenda`, `pengirim`, `no_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `created_at`, `user_id`) VALUES (13, 980, 'ggfgbd', 'ian', 'xca', '2025-11-05', '2025-11-07', 'sangat penting', 'c096c7a9a687b1a13284883a38324fc1.pdf', '2025-11-05 01:19:37', 1);
INSERT INTO `surat_masuk` (`id`, `no_agenda`, `pengirim`, `no_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `keterangan`, `file`, `created_at`, `user_id`) VALUES (14, 5, 'kecamatan tanjung sari ', '00/00/PM', 'rapat sekolah MA aliyah', '2025-11-27', '2025-11-27', 'Resmi', '56fedfd5e35ffc7ba60a0232d3f6537c.pdf', '2025-11-27 09:16:19', 1);


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
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`, `image`, `role_id`, `date_created`) VALUES (1, 'Akun Admin', 'admin123', 'admin@gmail.com', '$2y$10$w7390BXuXt7vh3QqMQ4n3urXcwanLliwSJGxb1WHTO1.ylY3m8Uci', 'default1.svg', 1, '1595945906');
INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`, `image`, `role_id`, `date_created`) VALUES (9, 'petugas', 'petugas', 'laodeiyan21@gmail.com', '$2y$10$3aGY01BUT.CFKiuCdpTApO3HSjR.F14fEsXsolH0q7uclaaHLa44.', 'default.svg', 2, '1771912692');


#
# TABLE STRUCTURE FOR: user_role
#

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`id`) REFERENCES `jabatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `user_role` (`id`, `role`) VALUES (1, 'Admin');
INSERT INTO `user_role` (`id`, `role`) VALUES (2, 'User');


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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (1, 'laodeiyan21@gmail.com', 'QyBMr0xbD3AL1uBkyUeM47pQRlH/HOT/IyGxA11OmFk=', '1762280646');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (2, 'laodeiyan21@gmail.com', 'glUmeShIybsfCtVq5Hk1XT0wYkJqrLCRbr4AhyVkKZ4=', '1762280671');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (3, 'laodeiyan21@gmail.com', 'O/Y/eyiMNzjHKe0L+8K80sxSY674LEhYtrBuhrUIeqo=', '1762280907');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (4, 'laodeian@gmail.com', 'Un9oizi3iwDHYhd8LbRYh4ykNTUF4Hr9UPikwRNwCqE=', '1762281108');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (5, 'user@gmail.com', 'txUS2+QDYbxKTask4C3IOIfINmLbiK6OtYX4BfyBxHE=', '1764227908');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (6, 'user@gmail.com', 'UKCogLaBVmyNL9+SRU0JuQh/bHulSzA7n+K6ErPtXoI=', '1764227916');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (7, 'user@gmail.com', '6i/8ErII83iyXBR66lHopwMqESJsmyTePYDujrwpEiE=', '1764227921');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (8, 'user@gmail.com', 'd7bidU5HRLAons8siJKsVSf9TSQBGd52GNPutai4BUk=', '1764227926');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (9, 'user@gmail.com', 'TdX/Bgf+dLxouoDOPFhBndmzlMb6PpS1IF7dUDercqI=', '1764227931');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (10, 'user@gmail.com', 'Oa6DSC3KpB1fI8GRVdi6+yYiZC+yavM+aDGWTGuCSpo=', '1764227936');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (11, 'user@gmail.com', 'erAp1PdUJu3MwWJgtxhmgZcRUwQ+y0subxGwSjzZza0=', '1764227941');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (12, 'user@gmail.com', 'P/PBHbbNN2wWOm7l5/g+9UYIqTOnqAySIdX2jXhBS9o=', '1764227946');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (13, 'user@gmail.com', '7T09frVfSDnzmDgWMYDFKjdoFQFvdKHDKNKrdJO95HA=', '1764227950');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (14, 'user@gmail.com', 'lam1doAlklTqrLU2qQq+45bitWYFHs+athE1Akq5P1s=', '1764227955');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (15, 'user@gmail.com', 'gP14aZY3OIN8arMLcxn6wOUjqDMDxApoCch26cj0q5c=', '1764227960');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (16, 'user@gmail.com', '6qXTN53FIHETXyRpk9n0+Ot5skn4pF8jTTsWNez4B7g=', '1764227966');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (17, 'user@gmail.com', 'F2kEH3ITRznVZBupLTRhpNtiFnnhHFleR9l8tW7v0Yw=', '1764227971');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (18, 'laodeiyan21@gmail.com', 'UUGeuw0o+sG293TvL4qLX5Nkq8HQ5e3pdBSiAboGeEw=', '1764228060');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (19, 'laodeiyan21@gmail.com', 'vkAdXQcBekfzxpCXj2PuFt9owJTXYMvv0hPVrxmQ/yQ=', '1764228065');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (20, 'laodeiyan21@gmail.com', 'QSOtONE2PjbFincIsmnhI0TTjTBV7obebzVeGCF6Lpk=', '1764228071');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (21, 'laodeiyan21@gmail.com', '96aE1vFY2TDgRJWfzSgb3ThHMY/T/9reEleGoLywtJU=', '1764228077');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (22, 'admin@gmail.com', 'R/SYv6sZx87bV8gDazsYSY/TVclLB5g3kP2n2abM0Qk=', '1770873494');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (23, 'admin@gmail.com', '+Xq22ld5yNOSvSUZQzV3QHw6taSschf6R7KflKaNEJY=', '1770873702');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (24, 'laodeiyan21@gmail.com', 'xDlidKktAqzA/pZx0c7Zrj6oGAsvsj9R8ZDuLfJ4liY=', '1770873849');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (25, 'petugas@gmail.com', 'DQNydp2m1oCb+EcQkOs13KmTCqQ1UfNQgtZlAKCkqEM=', '1771858452');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (26, 'petugas@gmail.com', 'z+wyTiemiaFME2vmwq/ilWNdMPESAmTFwLNbXZMwrNI=', '1771858591');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (27, 'petugas@gmail.com', '01F530DLTfJEvx3LB5Om8WlYJAKKWEhLpLgY2YPvGH4=', '1771858630');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (28, 'petugas@gmail.com', 'Xg9Vii1i9JbStfI/bQn9uJmKpfxbLYyQJLGFjCfjDH0=', '1771860740');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (29, 'petugas@gmail.com', 'EfmoQ+LNrLp6TAUT+FBxHQOJxzSqxjio13WoCsDjwTM=', '1771910954');
INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES (30, 'laodeiyan21@gmail.com', '9drC6Jalf+aKlWgWeikECIj6htEpmDbgOBBo04bEIhA=', '1771912748');


