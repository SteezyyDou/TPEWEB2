<?php
class GenreView {
<<<<<<< HEAD
    public function showGenres($genres, $error = null) {
=======
    function showGenres($genres) {
>>>>>>> 7bbd3ff5bd5239ab7c3dfbd189faf5137bafb75f
        require_once 'templates/header.phtml';
        require_once 'templates/genreView.phtml';
        require_once 'templates/footer.phtml';
    }

    function showMoviesByGenre($movies, $genre) {
        require_once 'templates/genreWatch.phtml';
        require_once 'templates/footer.phtml';
    }

    
}
