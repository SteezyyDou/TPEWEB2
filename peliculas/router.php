<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once 'app/controllers/movie_controller.php';
require_once 'app/controllers/auth_controller.php';
require_once 'app/controllers/admin_controller.php';
require_once 'app/controllers/genre_controller.php';



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
    case 'genres':
        $controller = new GenreController();
        $controller->listGenres();
        break;
    case 'moviesByGenre':
        $id = $params[1] ?? 0;
        $controller = new genreController();
        $controller->moviesByGenre($id);
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

                case 'addGenre':
                    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                        $controller->addGenre();
                    } else {
                        $controller->showAddGenreForm();
                    }
                    break;

                case 'editGenre':
                    $id = $params[2] ?? null;
                    if ($id) $controller->editGenre($id);
                    break;

                case 'updateGenre':
                    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                        $controller->updateGenre();
                    }
                    break;
                case 'genres':
                    $controller->listGenresAdmin();
                    break;

                case 'deleteGenre':
                    $id = $params[2] ?? null;
                    if ($id) $controller->deleteGenre($id);
                    break;

                default:
                    $controller->listMovies();
                    break;
            }
        } else {
            header('Location: ' . BASE_URL . 'login');
            exit;
        }
        break;
}
