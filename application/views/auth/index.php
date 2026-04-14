<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5 mx-auto">
                    <div class="card-body p-0">

                        <div class="card o-hidden border-0 shadow-lg">
                            <div class="card-body p-0">

                                <!-- Nested Row within Card Body -->
                                <div class="row">

                                    <!-- Bagian Gambar / Ilustrasi Login -->
                                    <div class="col-lg-6 d-block d-lg-block bg-login-image"></div>
                                    
                                    <!--        BAGIAN LOGIN       -->
                                    <div class="col-lg-6">
                                        <div class="p-5">

                                            <!-- Judul Halaman Login -->
                                            <div class="text-center">
                                                <h1 class="h4 text-gray-900 mb-4">
                                                    Selamat datang di sistem informasi Arsip, silahkan login!
                                                </h1>
                                            </div>

                                            <!-- Menampilkan Pesan Flash (Notifikasi Login) -->
                                            <?= $this->session->flashdata('message') ?>
                                            <!--        FORM LOGIN          -->
                                            <form class="user" method="post" action="<?= base_url() ?>">

                                                <!-- Input Username / Email -->
                                                <div class="form-group">
                                                    <input type="text"
                                                           class="form-control form-control-user border-left-primary"
                                                           name="username"
                                                           value="<?= set_value('username') ?>"
                                                           placeholder="Email atau username">

                                                    <!-- Menampilkan Validasi Error Username -->
                                                    <?= form_error('username', '<div><small class="text-danger pl-3">', '</small></div>') ?>
                                                </div>

                                                <!-- Input Password -->
                                                <div class="form-group">
                                                    <input type="password"
                                                           class="form-control form-control-user border-left-primary"
                                                           name="pass"
                                                           placeholder="Password">

                                                    <div class="input-group mb-3">
                                                        <!-- Menampilkan Validasi Error Password -->
                                                        <?= form_error('pass', '<div><small class="text-danger pl-3">', '</small></div>') ?>
                                                    </div>
                                                </div>

                                                <!-- Tombol Login -->
                                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                                    Login
                                                </button>
                                            </form>
                                            <hr>

                                            <!-- Link Lupa Password -->
                                            <div class="text-center">
                                                <a class="small" href="<?= base_url('auth/forgot-password'); ?>">
                                                    Lupa Password?
                                                </a>
                                            </div>

                                            <!-- Link Registrasi (Dinonaktifkan) -->
                                            <!--
                                            <div class="text-center">
                                                <a class="small" href="<?= base_url //('auth/registrasi'); ?>">
                                                    Belum punya akun? daftar!
                                                </a>
                                            </div>
                                            -->
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>