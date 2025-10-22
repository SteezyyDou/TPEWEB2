<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Películas del género: <?= $genre->nombre ?></title>
    <link rel="stylesheet" href="<?= BASE_URL ?>css/styles.css">
</head>

<body>
    <a href="<?= BASE_URL ?>genres" class="back-button">← Volver a generos</a>

    <h1>Películas del género: <?= $genre->nombre ?></h1>


    <div class="catalog">
    <?php if (!empty($movies)): ?>
        <?php foreach ($movies as $movie): ?>
            <a href="<?= BASE_URL ?>watch/<?= $movie->id ?>">
                <div class="movie">
                    <img src="<?= BASE_URL ?>img/home/<?= $movie->imagen ?>.jpg" alt="<?= $movie->titulo ?>">
                    <div class="info">
                        <h3><?= $movie->titulo ?></h3>
                    </div>
                </div>
            </a>
        <?php endforeach; ?>
    <?php else: ?>
        <p>No hay películas en este genero.</p>
    <?php endif; ?>
</div>



</body>

</html>