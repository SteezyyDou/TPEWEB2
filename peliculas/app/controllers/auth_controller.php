<?php
require_once 'app/models/user_model.php';

class authController {
    private $model;

    public function __construct() {
        $this->model = new UserModel();
    }

    public function loginForm() {
        require 'templates/loginView.phtml';
    }

    public function login() {
        $username = $_POST['username'] ?? '';
        $password = $_POST['password'] ?? '';

        $user = $this->model->getUserByUsername($username);

        if ($user && password_verify($password, $user->password)) {
            $_SESSION['username'] = $user->username;
            $_SESSION['rol'] = $user->rol;

    
            if ($user->rol === 'admin') {
                header('Location: ' . BASE_URL . 'admin');
                exit;
            } else {
                header('Location: ' . BASE_URL . 'home');
                exit;
            }
            
        } else {
            $error = "Usuario o contraseña incorrectos";
            require 'templates/loginView.phtml';
        }
    }

    public function logout() {
        session_destroy();
        header('Location: ' . BASE_URL . 'home');
    }
}
