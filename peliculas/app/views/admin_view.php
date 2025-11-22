<?php
class AdminView{

    function listMovies($movies){
        require_once 'templates/adminView.phtml';
    }
    public function showEditForm($movie){
        require 'templates/edit_movie.phtml';
    }
    function editMovie($movie, $genres){
        require 'templates/editView.phtml';
    }

    function showAddForm($genres){
        require 'templates/addView.phtml';
    }

    function showAddGenreForm() {
        require 'templates/addGenreView.phtml';
    }


    function editGenre($genre){
        require 'templates/editGenreView.phtml';
    }

    function listGenresAdmin($genres){
        require 'templates/adminGenresView.phtml';
    }
}
