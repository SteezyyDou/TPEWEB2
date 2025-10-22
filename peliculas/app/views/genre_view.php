<?php
class GenreView {
    function showGenres($genres) {
        require_once 'templates/genreView.php';
    }

    function showMoviesByGenre($movies, $genre) {
        require_once 'templates/genreWatch.php';
    }

    
}
