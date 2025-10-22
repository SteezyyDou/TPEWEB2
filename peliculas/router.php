
<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once 'app/controllers/movie_controller.php';
require_once 'app/controllers/auth_controller.php';
require_once 'app/controllers/admin_controller.php';



define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

$action = 'home'; 
if (!empty($_GET['action'])) {
    $action = $_GET['action'];
}

$params = explode('/', $action);
switch ($params[0]) {
    case 'home':
        if (!isset($_SESSION['username'])) {
            header('Location: ' . BASE_URL . 'login');
            exit;
        }
        $controller = new movieController();
        $controller->showMovies();
        break;
    case 'watch':
        $id = $params[1] ?? 0;
        $controller = new movieController();
        $controller->showMovie($id);
        break;
    case 'login':
        $controller = new authController();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $controller->login();
        } else {
            $controller->loginForm();
        }
        break;
    case 'logout':
        $controller = new authController();
        $controller->logout();
        break;
   case 'admin':
        if ($_SESSION['rol'] === 'admin') {
            $controller = new AdminController();
            $subaction = $params[1] ?? null;

            switch ($subaction) {
                case 'delete':
                    $id = $params[2] ?? null;
                    if ($id) $controller->deleteMovie($id);
                    break;

                case 'edit':
                    $id = $params[2] ?? null;
                    if ($id) $controller->editMovie($id);
                    break;

                case 'update':
                    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                        $controller->updateMovie();
                    }
                    break;
                case 'add':
                    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                        $controller->addMovie();
                    } else {
                        $controller->showAddForm();
                    }
                    break;

                default:
                    $controller->listMovies();
                    break;
            }
        }
        break;
    default:
        echo "404 Page Not Found";
        break;
}
