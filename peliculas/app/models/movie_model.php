<?php
require_once 'Model.php';

class MovieModel extends Model {

    public function getMovies() {
        $query = $this->db->prepare('SELECT peliculas.*, generos.nombre AS genero_nombre
            FROM peliculas
            LEFT JOIN generos ON peliculas.genero_id = generos.id');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getMovieById($id) {
        $query = $this->db->prepare('
            SELECT peliculas.*, generos.nombre AS genero_nombre
            FROM peliculas
            LEFT JOIN generos ON peliculas.genero_id = generos.id
            WHERE peliculas.id = ?
        ');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ) ?: null;
    }

    public function getGenres() {
        $query = $this->db->prepare('SELECT * FROM generos');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function updateMovie($id, $titulo, $director, $año, $descripcion, $genero_id) {
    $query = $this->db->prepare("
        UPDATE peliculas
        SET titulo = ?, director = ?, año = ?, descripcion = ?, genero_id = ?
        WHERE id = ?
    ");
    $query->execute([$titulo, $director, $año, $descripcion, $genero_id, $id]);
    }

    public function deleteMovie($id) {
        $query = $this->db->prepare("DELETE FROM peliculas WHERE id = ?");
        $query->execute([$id]);
    }

    public function addMovie($titulo, $director, $año, $descripcion, $duracion, $genero_id) {
        $query = $this->db->prepare("
        INSERT INTO peliculas (titulo, director, año, descripcion, duracion, genero_id) VALUES (?, ?, ?, ?, ?, ?)");
        $query->execute([$titulo, $director, $año, $descripcion, $duracion, $genero_id]);
    }

    function getMoviesByGenre($genreId) {
        $query = $this->db->prepare('SELECT * FROM peliculas WHERE genero_id = ?');
        $query->execute([$genreId]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

}

