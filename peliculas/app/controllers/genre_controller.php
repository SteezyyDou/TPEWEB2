<?php
include_once 'app/models/genre_model.php';
include_once 'app/views/genre_view.php';

class GenreController {
    private $genreModel;
    private $genreView;
    private $movieModel;

    public function __construct() {
        $this->genreModel = new GenreModel();
        $this->genreView = new GenreView();

        require_once 'app/models/movie_model.php';
        $this->movieModel = new movieModel();
    }

    public function listGenres() {
        $genres = $this->genreModel->getAllGenres();
        $this->genreView->showGenres($genres);
    }

    public function moviesByGenre($id) {
        $genre = $this->genreModel->getGenreById($id);
        $movies = $this->movieModel->getMoviesByGenre($id);
        $this->genreView->showMoviesByGenre($movies, $genre);
    }
}
