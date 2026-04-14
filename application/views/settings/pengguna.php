<!-- Container utama halaman -->
<div class="container-fluid">

    <div class="row mt-2">
        <div class="col-12">

            <!-- Menampilkan judul halaman -->
            <h3 class="h3 text-gray-800 my-2"><?= $judul ?></h3>

            <!-- Notifikasi pesan berhasil menggunakan flashdata -->
            <?php if ($this->session->flashdata('msg')) : ?>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    Pengguna berhasil <strong><?= $this->session->flashdata('msg'); ?></strong>
                </div>
            <?php endif; ?>

            <div class="row">
                <div class="col">
                    <!-- Card untuk menampilkan data pengguna -->
                    <div class="card shadow">
                        <div class="card-header">

                            <!-- Tombol untuk membuka modal tambah data -->
                            <button type="button" data-toggle="modal" data-target="#modalTambah" class="btn btn-primary btn-modal">Tambah Data</button>

                        </div>
                        <div class="card-body">
                            <div class="table-responsive">

                                <!-- Tabel daftar pengguna -->
                                <table class="table table-striped" id="tbl-pengguna" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Nama</th>
                                            <th>Username</th>
                                            <th>Email</th>
                                            <th>Role</th>
                                            <th>Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <!-- Perulangan data pengguna dari database -->
                                        <?php foreach ($pengguna as $num => $p) : ?>
                                            <tr>

                                                <!-- Nomor urut -->
                                                <td><?= $num + 1; ?></td>

                                                <!-- Menampilkan nama -->
                                                <td><?= $p['name']; ?></td>

                                                <!-- Menampilkan username -->
                                                <td><?= $p['username']; ?></td>

                                                <!-- Menampilkan email -->
                                                <td><?= $p['email']; ?></td>

                                                <!-- Menampilkan role -->
                                                <td><?= $p['role']; ?></td>

                                                <!-- Tombol aksi hapus (membuka modal hapus) -->
                                                <td>
                                                    <a href="" data-toggle="modal" data-target="#modalHapus" class="btn btn-sm btn-danger btn-hapus" data-id="<?= $p['id']; ?>">hapus</a>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

</div>

</div>

<!-- Modal untuk menambahkan pengguna baru -->
<div class="modal fade" id="modalTambah" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <!-- Header modal tambah -->
            <div class="modal-header badge-primary">
                <h5 class="modal-title">Tambah <?= $judul; ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <!-- Form tambah pengguna -->
            <form action="<?= base_url('pengaturan/pengguna_tambah'); ?>" id="formTambahPengguna" method="post">
                <div class="modal-body">

                    <!-- Input Nama -->
                    <div class="form-group">
                        <input type="text" name="name" id="name" class="form-control" value="<?= set_value('name'); ?>" placeholder="Masukkan nama lengkap...">
                        <div class="invalid-feedback"></div>
                    </div>

                    <!-- Input Username -->
                    <div class="form-group">
                        <input type="text" name="username" id="username" class="form-control" value="<?= set_value('username'); ?>" placeholder="Masukkan username...">
                        <div class="invalid-feedback"></div>
                    </div>

                    <!-- Input Email -->
                    <div class="form-group">
                        <input type="text" name="email" id="email" class="form-control" value="<?= set_value('email'); ?>" placeholder="Masukkan Email...">
                        <div class="invalid-feedback"></div>
                    </div>

                    <!-- Input Password -->
                    <div class="form-group">
                        <input type="password" name="pass1" id="password" class="form-control" placeholder="Password...">
                        <div class="invalid-feedback"></div>
                    </div>

                    <!-- Input Konfirmasi Password -->
                    <div class="form-group">
                        <input type="password" name="pass2" id="password" class="form-control" placeholder="Konfirmasi Password...">
                        <div class="invalid-feedback"></div>
                    </div>

                    <!-- Pilihan Role -->
                    <label>Role: </label>

                    <!-- Perulangan data role -->
                    <?php foreach ($role as $data) : ?>
                        <div class="form-check-inline">
                            <input class="form-check-input" type="radio" name="role_id" id="<?= $data['role']; ?>" value="<?= $data['id']; ?>" checked>
                            <label class="form-check-label" for="<?= $data['role']; ?>">
                                <?= $data['role']; ?>
                            </label>
                        </div>
                    <?php endforeach; ?>

                </div>

                <!-- Tombol aksi modal tambah -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="btn-tambah">Tambah Data</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal konfirmasi hapus pengguna -->
<div class="modal fade" id="modalHapus" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <!-- Header modal hapus -->
            <div class="modal-header badge-primary">
                <h5 class="modal-title">Hapus <?= $judul; ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <!-- Form hapus pengguna -->
            <form action="<?= base_url('pengaturan/pengguna_hapus'); ?>" id="formHapusPengguna" method="post">
                <div class="modal-body">

                    <!-- Pesan konfirmasi -->
                    Apakah anda yakin ingin menghapus data ini?

                    <!-- Input hidden untuk menyimpan ID pengguna -->
                    <input type="hidden" name="id" id="id">
                </div>

                <!-- Tombol aksi modal hapus -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="btn-hapus">Yakin</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="<?= base_url('assets/') ?>vendor/jquery/jquery.min.js"></script>
<script src="<?= base_url('assets/') ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<?= base_url('assets/') ?>vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="<?= base_url('assets/') ?>js/sb-admin-2.min.js"></script>
<script src="<?= base_url('assets/') ?>vendor/datatables/jquery.dataTables.min.js"></script>
<script src="<?= base_url('assets/') ?>vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/rowreorder/1.2.7/js/dataTables.rowReorder.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
<script src="<?= base_url('assets/') ?>vendor/sweetalert/sweetalert2.all.min.js"></script>

<script>
    $(document).ready(function() {
        $("#tbl-pengguna").DataTable()

        $(".btn-modal").click(function() {
            $('form:eq(1)')[0].reset();
            $(".is-valid").removeClass("is-valid");
            $(".is-invalid").removeClass("is-invalid");
            $(".invalid-feedback").empty();
        });

        $("#formTambahPengguna").submit(function(e) {
            e.preventDefault();

            $.ajax({
                url: $(this).attr('action'),
                type: $(this).attr('method'),
                dataType: 'json',
                data: $(this).serialize(),
                beforeSend: function() {
                    $("#btn-tambah").html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> <i>Loading...</i>')
                },
                complete: function() {
                    $("#btn-tambah").html('Tambah Data')
                },
                success: function(res) {
                    if (res.status) {
                        $("#modalTambah").modal("toggle")

                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: res.msg,
                            showConfirmButton: false,
                            timer: 1000
                        })
                        setTimeout(function() {
                            location.reload()
                        }, 1000);
                    } else {
                        $.each(res.errors, function(key, value) {
                            $('[name="' + key + '"]').addClass('is-invalid')
                            $('[name="' + key + '"]').next().text(value)
                            if (value == "") {
                                $('[name="' + key + '"]').removeClass('is-invalid')
                                $('[name="' + key + '"]').addClass('is-valid')
                            }
                        })
                    }
                }
            })

            $("#formTambahPengguna input").on('keyup', function() {
                $(this).removeClass('is-valid is-invalid')
            })
        })

        $(document).on("click", ".btn-hapus", function() {
            $(".modal-body #id").val($(this).data('id'))
        })

        $("#formHapusPengguna").submit(function(e) {
            e.preventDefault();

            $.ajax({
                url: $(this).attr('action'),
                type: $(this).attr('method'),
                dataType: 'json',
                data: $(this).serialize(),
                beforeSend: function() {
                    $("#btn-hapus").html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> <i>Loading...</i>')
                },
                complete: function() {
                    $("#btn-hapus").html('Yakin')
                },
                success: function(res) {
                    if (res.status) {
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: res.msg,
                            showConfirmButton: false,
                            timer: 1000
                        })
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
                    }
                }
            });
        });

    })
</script>