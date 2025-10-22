<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Generos</title>
    <link rel="stylesheet" href="<?= BASE_URL ?>css/styles.css">
</head>

<body>
    <a href="<?= BASE_URL ?>" class="back-button">← Volver a peliculas</a>
    <h1>Catálogo de Géneros</h1>

    <div class="catalog">
        <?php if (!empty($genres)): ?>
            <?php foreach ($genres as $genre): ?>
                <?php
                $imagePath = "img/generos/{$genre->id}.jpg";

                if (!file_exists($imagePath)) {
                    $imagePath = "img/notfound.jpg";
                }
                ?>
                <a href="<?= BASE_URL ?>moviesByGenre/<?= $genre->id ?>">
                    <div class="movie">
                        <img src="<?= BASE_URL . $imagePath ?>" alt="<?= $genre->nombre ?>">
                        <div class="info">
                            <h3><?= $genre->nombre ?></h3>
                        </div>
                    </div>
                </a>
            <?php endforeach; ?>
        <?php else: ?>
            <p>No hay géneros cargados.</p>
        <?php endif; ?>
    </div>
</body>

</html>