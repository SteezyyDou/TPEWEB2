<?php
include_once 'app/models/movie_model.php';
include_once 'app/views/movie_view.php';

class movieController {

    private $model;
    private $view;

    function __construct(){
        $this->model= new movieModel();
        $this->view = new MovieView();
    }

    function showMovies(){
        $movies = $this->model->getMovies();
        $this->view->showMovies($movies);
    }

    function showMovie($id){
        $movie = $this->model->getMovieById($id);
        $this->view->showMovie($movie);
    }

}
