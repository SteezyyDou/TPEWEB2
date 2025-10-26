<?php
require_once 'Model.php';

class GenreModel extends Model {
    public function getAllGenres() {
        $query = $this->db->prepare('SELECT * FROM generos ORDER BY nombre');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getGenreById($id) {
        $query = $this->db->prepare('SELECT * FROM generos WHERE id = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function getMoviesByGenre($genreId) {
        $query = $this->db->prepare('SELECT * FROM peliculas WHERE genero_id = ?');
        $query->execute([$genreId]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function addGenre($nombre) {
        $query = $this->db->prepare('INSERT INTO generos(nombre) VALUES (?)');
        $query->execute([$nombre]);
        return $this->db->lastInsertId();
    }

    public function updateGenre($id, $nombre) {
        $query = $this->db->prepare("UPDATE generos SET nombre = ? WHERE id = ?");
        $query->execute([$nombre, $id]);
    }

    public function deleteGenre($id) {
        $query = $this->db->prepare("DELETE FROM generos WHERE id = ?");
        $query->execute([$id]);
    }
}
