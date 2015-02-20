<?php
$Root = '../../../';
$appTitle = "Music OCR";
$appTagline = "Easy Learning Through Sound Recognition for Sheet Music";
$pageTitle = $appTitle.' - An Application from Simple.Gy';
$bodyAttr = 'class="landingPage dark"';
$workKey = basename(getcwd());
require $Root.'_phpCode/01_headLanding.php';
?>

<section class="hero-unit">
    <h1 class="text-error">
        <?= $appTitle ?>
    </h1>
    <h2><?= $appTagline ?></h2>
</section>

<p>

</p>

<a class="btn btn-large btn-block btn-danger" href="#">
    <i class="icon-music icon-white"></i>
    Get Started
</a>

<p></p>

<p>
    Hear sheet music by taking a picture. Never struggle to understand complex timings again.
</p>

<?php
require $Root.'_phpCode/10_end.php';
?>