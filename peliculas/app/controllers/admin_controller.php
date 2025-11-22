<?php
include_once 'app/views/admin_view.php';
include_once 'app/models/movie_model.php';

class AdminController {

    private $view;

    private $model;

    function __construct(){
        $this->view = new AdminView();
        $this->model = new MovieModel();
<<<<<<< HEAD

        require_once 'app/models/genre_model.php';
        require_once 'app/views/genre_view.php';

        $this->genreModel = new GenreModel();
        $this->genreView = new GenreView();
    }


=======
    }

>>>>>>> 7bbd3ff5bd5239ab7c3dfbd189faf5137bafb75f
    function listMovies(){
        $movies = $this->model->getMovies();
        $this->view->listMovies($movies);
    }

    function showEditForm($id){
        $movie = $this->model->getMovieById($id);
        $this->view->showEditForm($movie);
    }

    function updateMovie(){
        if (!empty($_POST['titulo']) && !empty($_POST['director']) && !empty($_POST['año']) && !empty($_POST['descripcion'])) {
            $id = $_POST['id'];
            $titulo = $_POST['titulo'];
            $director = $_POST['director'];
            $año = $_POST['año'];
            $descripcion = $_POST['descripcion'];
            $genero_id = $_POST['genero_id'];

            $this->model->updateMovie($id, $titulo, $director, $año, $descripcion, $genero_id);
        }

        header("Location: " . BASE_URL . "admin/listMovies");
    }

    function editMovie($id){
        $movie = $this->model->getMovieById($id);
        $genres = $this->model->getGenres();
        $this->view->editMovie($movie, $genres);
    }

    function deleteMovie($id){
        $this->model->deleteMovie($id);
        header("Location: " . BASE_URL . "admin");
    }

    public function showAddForm(){
        $genres = $this->model->getGenres();
        $this->view->showAddForm($genres);
    }

    public function addMovie(){
        if (
            !empty($_POST['titulo']) && !empty($_POST['director']) &&
            !empty($_POST['año']) && !empty($_POST['descripcion']) &&
            !empty($_POST['duracion']) && !empty($_POST['genero_id'])
        ) {

            $titulo = $_POST['titulo'];
            $director = $_POST['director'];
            $año = $_POST['año'];
            $descripcion = $_POST['descripcion'];
            $duracion = $_POST['duracion'];
            $genero_id = $_POST['genero_id'];

            $this->model->addMovie($titulo, $director, $año, $descripcion, $duracion, $genero_id);
        }

        header("Location: " . BASE_URL . "admin/listMovies");
    }

    public function addGenre() {
        if (!empty($_POST['nombre'])) {
            require_once 'app/models/genre_model.php';
            $genreModel = new GenreModel();

            $lastId = $genreModel->addGenre($_POST['nombre']);

            if (isset($_FILES['imageToUpload']) && $_FILES['imageToUpload']['error'] === 0) {
                $ext = pathinfo($_FILES['imageToUpload']['name'], PATHINFO_EXTENSION);
                $targetPath = "img/generos/{$lastId}.{$ext}";
                move_uploaded_file($_FILES['imageToUpload']['tmp_name'], $targetPath);
            }
        }

        header("Location: " . BASE_URL . "admin/genres");
        exit;
    }

<<<<<<< HEAD
=======



>>>>>>> 7bbd3ff5bd5239ab7c3dfbd189faf5137bafb75f
    public function showAddGenreForm(){
        require_once 'app/views/admin_view.php';
        $view = new AdminView();
        $view->showAddGenreForm();
    }

<<<<<<< HEAD
=======

>>>>>>> 7bbd3ff5bd5239ab7c3dfbd189faf5137bafb75f
    public function editGenre($id_or_object){
        require_once 'app/models/genre_model.php';
        $genreModel = new GenreModel();

        if (is_object($id_or_object)) {
            $genre = $id_or_object;
        } else {
            $genre = $genreModel->getGenreById($id_or_object);
            if (!$genre) {
                echo "<h2>Género no encontrado</h2>";
                return;
            }
        }

        require_once 'app/views/admin_view.php';
        $view = new AdminView();
        $view->editGenre($genre);
    }

    public function updateGenre() {
        if (!empty($_POST['id']) && !empty($_POST['nombre'])) {
            require_once 'app/models/genre_model.php';
            $genreModel = new GenreModel();

            $id = $_POST['id'];
            $nombre = $_POST['nombre'];

            $genreModel->updateGenre($id, $nombre);

            if (isset($_FILES['imageToUpload']) && $_FILES['imageToUpload']['error'] === 0) {
                $ext = pathinfo($_FILES['imageToUpload']['name'], PATHINFO_EXTENSION);
                $targetPath = "img/generos/{$id}.{$ext}";

                foreach (glob("img/generos/{$id}.*") as $oldImage) {
                    unlink($oldImage);
                }

                move_uploaded_file($_FILES['imageToUpload']['tmp_name'], $targetPath);
            }
        }

        header("Location: " . BASE_URL . "admin/genres");
        exit;
    }


<<<<<<< HEAD
    public function listGenresAdmin($error = null){
=======
    public function listGenresAdmin(){
>>>>>>> 7bbd3ff5bd5239ab7c3dfbd189faf5137bafb75f
        require_once 'app/models/genre_model.php';
        $genreModel = new GenreModel();
        $genres = $genreModel->getAllGenres();

        require_once 'app/views/admin_view.php';
        $view = new AdminView();
<<<<<<< HEAD
        $view->listGenresAdmin($genres, $error);
    }


    public function deleteGenre($id) {
        if (!isset($this->genreModel)) {
            require_once 'app/models/genre_model.php';
            $this->genreModel = new GenreModel();
        }

        if ($this->genreModel->hasMovies($id)) {
            $error = "Este género no puede eliminarse porque tiene películas asociadas.";
            echo $error;
            $genres = $this->genreModel->getAllGenres();
            $this->view->listGenresAdmin($genres, $error);
            return;
        }

        $this->genreModel->deleteGenre($id);

        foreach (glob("img/generos/{$id}.*") as $file) {
            if (is_file($file)) {
                unlink($file);
            }
        }

        header("Location: " . BASE_URL . "admin/genres");
        exit;
    }
=======
        $view->listGenresAdmin($genres);
    }

    public function deleteGenre($id) {
    require_once 'app/models/genre_model.php';
    $genreModel = new GenreModel();

    $genreModel->deleteGenre($id);

    foreach (glob("img/generos/{$id}.*") as $file) {
        if (file_exists($file)) {
            unlink($file);
        }
    }

    header("Location: " . BASE_URL . "admin/genres");
    exit;
}

>>>>>>> 7bbd3ff5bd5239ab7c3dfbd189faf5137bafb75f
}
