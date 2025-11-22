<?php
class GenreView {
    public function showGenres($genres, $error = null) {
        require_once 'templates/header.phtml';
        require_once 'templates/genreView.phtml';
        require_once 'templates/footer.phtml';
    }

    function showMoviesByGenre($movies, $genre) {
        require_once 'templates/genreWatch.phtml';
        require_once 'templates/footer.phtml';
    }

    
}
