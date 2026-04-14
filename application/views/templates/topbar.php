<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

  <!-- Main Content -->
  <div id="content">

    <!-- Topbar -->
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

      <!-- Sidebar Toggle (Topbar) -->
      <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
      </button>

       <!-- Custom Header Text -->
      <div class="d-none d-lg-block mx-auto">
        <span class="text-primary font-weight-bold m-0">
          Selamat Datang Di Sistem Informasi Arsip MA Al-Ihya Bekasi
        </span>
      </div>

      <!-- Topbar Navbar -->
      <ul class="navbar-nav ml-auto">

        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
          <?php
          // SAFE fallback supaya tidak error kalau $user null
          $top_username = isset($user['username']) ? $user['username'] : 'Guest';
          $top_image = isset($user['image']) && !empty($user['image'])
                       ? base_url('assets/img/profile/' . $user['image'])
                       : base_url('assets/img/profile/default.png'); // pakai default kalau tidak ada
          ?>
          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
             aria-haspopup="true" aria-expanded="false">
            <span class="mr-2 d-none d-lg-inline text-gray-800 small"><?= $top_username; ?></span>
            <img class="img-profile rounded-circle" alt="image-profile" src="<?= $top_image; ?>">
          </a>
          <!-- Dropdown - User Information -->
          <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
               aria-labelledby="userDropdown">
            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
              <i class="fas fa-sign-out-alt fa-sm fa-fw text-gray-400"></i>
              Logout
            </a>
          </div>
        </li>

      </ul>

    </nav>
    <!-- End of Topbar -->