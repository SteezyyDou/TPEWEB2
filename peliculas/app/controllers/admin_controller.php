<?php
include_once 'app/views/admin_view.php';
include_once 'app/models/movie_model.php';

class AdminController{

    private $view;

    private $model;

    function __construct(){
        $this->view = new AdminView();
        $this->model = new MovieModel();
    }

   function listMovies(){
        $movies = $this->model->getMovies();
        $this->view->listMovies($movies);
   }   

    function showEditForm($id) {
        $movie = $this->model->getMovieById($id);
        $this->view->showEditForm($movie);
    }

    function updateMovie() {
        if (!empty($_POST['titulo']) &&!empty($_POST['director']) &&!empty($_POST['año']) &&!empty($_POST['descripcion'])) {
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

    function editMovie($id) {
        $movie = $this->model->getMovieById($id);
        $genres = $this->model->getGenres();
        $this->view->editMovie($movie,$genres);
    }

   function deleteMovie($id) {
        $this->model->deleteMovie($id);
        header("Location: " . BASE_URL . "admin");
    }    

    public function showAddForm() {
        $genres = $this->model->getGenres();
        $this->view->showAddForm($genres);
    }

    public function addMovie() {
        if (!empty($_POST['titulo']) && !empty($_POST['director']) &&
            !empty($_POST['año']) && !empty($_POST['descripcion']) &&
            !empty($_POST['duracion']) && !empty($_POST['genero_id'])) {

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


}



