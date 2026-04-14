<body class="bg-gradient-primary">

    <div class="container">
        <!--        WRAPPER HALAMAN        -->
        <div class="row justify-content-center">

            <div class="col-lg-7">

                <!-- Card utama form ubah password -->
                <div class="card o-hidden border-0 shadow-lg my-5 mx-auto">
                    <div class="card-body p-0">

                        <!-- Nested Row -->
                        <div class="row">

                            <div class="col-lg">
                                <div class="p-5">
                                    <!--      JUDUL & EMAIL RESET      -->
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900">
                                            Ubah password untuk 
                                            <!-- Menampilkan email yang sedang melakukan reset -->
                                            <h5 class="mb-4">
                                                <?= $this->session->userdata('reset_email'); ?>
                                            </h5>
                                        </h1>
                                    </div>
                                    <!--   FLASH MESSAGE / NOTIFIKASI  -->               
                                    <?= $this->session->flashdata('message'); ?>

                                    <!--       FORM UBAH PASSWORD      -->
                                    <form class="user" method="post" action="<?= base_url('auth/changePassword'); ?>">

                                        <!-- Input Password Baru -->
                                        <div class="form-group">
                                            <input type="password"
                                                   name="password1"
                                                   class="form-control form-control-user"
                                                   id="password1"
                                                   placeholder="Masukan password baru...">

                                            <!-- Validasi Error Password Baru -->
                                            <?= form_error('password1', '<div><small class="text-danger pl-3">', '</small></div>') ?>
                                        </div>

                                        <!-- Input Konfirmasi Password -->
                                        <div class="form-group">
                                            <input type="password"
                                                   name="password2"
                                                   class="form-control form-control-user"
                                                   id="password2"
                                                   placeholder="Konfirmasi password baru...">

                                            <!-- Validasi Error Konfirmasi Password -->
                                            <?= form_error('password2', '<div><small class="text-danger pl-3">', '</small></div>') ?>
                                        </div>

                                        <!-- Tombol Submit Ubah Password -->
                                        <button type="submit" class="btn btn-primary btn-user btn-block">
                                            Ubah Password
                                        </button>

                                    </form>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>