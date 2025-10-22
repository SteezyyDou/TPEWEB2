<?php
require_once 'Model.php';

class UserModel extends Model {

    public function getUserByUsername($username) {
        $query = $this->db->prepare("SELECT * FROM usuarios WHERE username = ?");
        $query->execute([$username]);
        return $query->fetch(PDO::FETCH_OBJ) ?: null;
    }

}
