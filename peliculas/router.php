<?php

require_once 'app/controllers/movie_controller.php';

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

$action = 'home'; 
if (!empty($_GET['action'])) {
    $action = $_GET['action'];
}

$params = explode('/', $action);
switch ($params[0]) {
    case 'home':
        $controller = new movieController();
        $controller->showMovies();
        break;
     case 'watch':
          $id = $params[1] ?? 0;
          $controller = new movieController();
          $controller->showMovie($id);
          break;
    default:
        echo "404 Page Not Found";
        break;
}
