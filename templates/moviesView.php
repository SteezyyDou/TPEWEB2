<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Películas</title>
    <link rel="stylesheet" href="<?= BASE_URL?>css/styles.css">
</head>
<body>
    <a href="<?= BASE_URL ?>genres" class="back-button">Ver géneros</a>
    <h1>Películas</h1>

    <div class="catalog">
       <?php foreach ($movies as $movie): ?>
        <a href="<?= BASE_URL ?>watch/<?= $movie->id ?>-<?= urlencode($movie->titulo)?>">
        <div class="movie">
            <img src="<?= BASE_URL ?>img/home/<?= $movie->imagen ?>.jpg" alt="<?= $movie->titulo ?>">
            <div class="info">
            <h3><?= $movie->titulo ?></h3>
            </div>
        </div>
         </a>
        <?php endforeach; ?>

    </div>
    
</body>
</html>
