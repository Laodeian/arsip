<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Database extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logout();
        is_admin();

        // ============================
        // TAMBAHAN: load helper file
        // ============================
        $this->load->helper('file');

        $this->user = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        $this->load->model('Pengaturan_model', 'pengaturan');
    }

    public function index()
    {
        $data = [
            'judul' => 'Back Up dan Restore Database',
            'user' => $this->user,
        ];

        $this->template->render_page('settings/database', $data);
    }

    public function backup()
    {
        if (isset($_POST['backup'])) {

            $this->load->dbutil();

            $filter = $this->input->post('filterby');

            $arr = ['jabatan', 'disposisi', 'sifat', 'surat_masuk', 'surat_keluar', 'user', 'user_role', 'user_token'];

            // ====================================================
            // TAMBAHAN: jika pilih "semua", backup semua tabel
            // ====================================================
            if ($filter == 'semua') {

                $prefs = [
                    'tables' => $arr,
                    'format' => 'txt',
                    'filename' => 'backup_semua.sql',
                    'add_drop' => true,
                    'add_insert' => true,
                ];

                $backup = $this->dbutil->backup($prefs);

                // TAMBAHAN: pastikan folder ada
                if (!is_dir('./backup/database/')) {
                    mkdir('./backup/database/', 0777, true);
                }

                write_file('./backup/database/backup_semua.sql', $backup);

            } else {

                $ignores = '';

                if (in_array($filter, $arr)) {
                    $ignores = array_filter($arr, function ($val) use ($filter) {
                        return $val !== $filter;
                    });
                }

                $prefs = [
                    'table' => $filter,
                    'ignore' => $ignores,
                    'format' => 'txt',
                    'filename' => $filter . '.sql',
                    'add_drop' => true,
                    'add_insert' => true,
                ];

                $backup = $this->dbutil->backup($prefs);

                // TAMBAHAN: pastikan folder ada
                if (!is_dir('./backup/database/')) {
                    mkdir('./backup/database/', 0777, true);
                }

                write_file('./backup/database/' . $prefs['filename'], $backup);
            }

            $this->session->set_flashdata('msg', 'Back Up');
            redirect('database');

            exit(0);
        }

        return redirect('database');
    }

    public function restore()
{
    if (isset($_POST['restore'])) {

        $filter = $this->input->post('filterby');

        if ($filter == 'semua') {
            $file = './backup/database/backup_semua.sql';
        } else {
            $file = './backup/database/' . $filter . '.sql';
        }

        if (!file_exists($file)) {
            $this->session->set_flashdata('err', 'Restore');
            redirect('database');
        }

        $isi_file = file_get_contents($file);

        if (empty($isi_file)) {
            $this->session->set_flashdata('err', 'Restore');
            redirect('database');
        } else {

            //  MATIKAN FOREIGN KEY
            $this->db->query('SET FOREIGN_KEY_CHECKS=0');

            $query = rtrim($isi_file, "\n;");
            $array_query = explode(";", $query);

            foreach ($array_query as $query) {
                if (trim($query) != "") {
                    $this->db->query($query);
                }
            }

            // HIDUPKAN KEMBALI FOREIGN KEY
            $this->db->query('SET FOREIGN_KEY_CHECKS=1');

            $this->session->set_flashdata('msg', 'Restore');
            redirect('database');
        }
    }

    return redirect('database');
    }
}