
<?php
class MovieView{
    function showMovies($movies){
      require_once 'templates/header.phtml';
      require_once 'templates/moviesView.phtml';
      require_once 'templates/footer.phtml';
    }

    function showMovie($movie){
      require_once 'templates/watchView.phtml';
    }
  }