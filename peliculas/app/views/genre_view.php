<?php
class GenreView {
    function showGenres($genres) {
        require_once 'templates/header.phtml';
        require_once 'templates/genreView.phtml';
        require_once 'templates/footer.phtml';
    }

    function showMoviesByGenre($movies, $genre) {
        require_once 'templates/genreWatch.phtml';
        require_once 'templates/footer.phtml';
    }

    
}
