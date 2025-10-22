<?php 
class movieModel{
    function connect(){
        return new PDO('mysql:host=localhost;dbname=catalogo_peliculas_db;charset=utf8','root','');
    }
    function getMovies(){
        $db = $this->connect();
        $query = $db -> prepare('SELECT * FROM peliculas');
        $query -> execute();

        $movies = $query->fetchAll(PDO::FETCH_OBJ);


        return $movies;
    }
    function getMovieById($id){
        $db = $this->connect();
        $query = $db->prepare('SELECT peliculas.*, generos.nombre AS genero_nombre
            FROM peliculas
            LEFT JOIN generos ON peliculas.genero_id = generos.id
            WHERE peliculas.id = ?');
        $query->execute([$id]);
    

        $movie = $query->fetch(PDO::FETCH_OBJ);
        return $movie;
}

function getMoviesByGenre($genreId) {
    $db = $this->connect();
    $query = $db->prepare('SELECT * FROM peliculas WHERE genero_id = ?');
    $query->execute([$genreId]);
    return $query->fetchAll(PDO::FETCH_OBJ);
}


}