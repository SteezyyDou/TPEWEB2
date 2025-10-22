<?php
 class MovieView{
    function showMovies($movies){
       require_once 'templates/moviesView.php';
    }

    function showMovie($movie){
      require_once 'templates/movieWatch.php';
    }
 }