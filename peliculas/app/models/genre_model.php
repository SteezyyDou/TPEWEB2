<?php
class genreModel {
    function connect() {
        return new PDO('mysql:host=localhost;dbname=catalogo_peliculas_db;charset=utf8', 'root', '');
    }

    function getAllGenres() {
        $db = $this->connect();
        $query = $db->prepare('SELECT * FROM generos ORDER BY nombre');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getGenreById($id) {
        $db = $this->connect();
        $query = $db->prepare('SELECT * FROM generos WHERE id = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function getMoviesByGenre($genreId) {
        $db = $this->connect();
        $query = $db->prepare('SELECT * FROM peliculas WHERE genero_id = ?');
        $query->execute([$genreId]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

}
