<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User_model extends CI_Model
{
    // Ambil data user berdasarkan ID (misalnya untuk profile)
    public function get_user_data($id)
    {
        return $this->db
            ->select('email, username, image, role_id')
            ->where('id', $id)
            ->get('user')
            ->row_array();
    }

    // Update profile user
    public function ubahProfile($image = false)
    {
        // Ambil email dari session ‑ ini sesuai login
        $email = $this->session->userdata('email');

        // Jika ada gambar di‑upload
        if ($image != false) {
            $this->db->set('image', $image);
        }

        // Update username berdasarkan email session
        $this->db->set('username', $this->input->post('username', TRUE));
        $this->db->where('email', $email);
        $this->db->update('user');

        // Pesan sukses
        $this->session->set_flashdata('msg', '<div class="alert alert-success p-0 m-0">Profile berhasil diperbarui.</div>');

        echo json_encode(['status' => TRUE]);
    }

    // Update password user
    public function ubahPassword()
    {
        // Ambil email dari session
        $email = $this->session->userdata('email');

        // Enkripsi password baru
        $pass_hash = password_hash($this->input->post('newpass'), PASSWORD_DEFAULT);

        // Update password di database
        $this->db->set('password', $pass_hash);
        $this->db->where('email', $email);
        $this->db->update('user');

        // Pesan sukses
        $this->session->set_flashdata('ubahpass', '<div class="alert alert-success p-0 m-0">Password berhasil diubah.</div>');
        
        echo json_encode(['status' => TRUE]);
    }
}