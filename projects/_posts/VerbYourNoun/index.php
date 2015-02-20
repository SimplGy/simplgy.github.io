<?php
$Root = '../../../';
$appTitle = "Verb Your Noun";
$appTagline = "The Magical Silly Phrase Generator";
$pageTitle = $appTitle.' - An Application from Simple.Gy';
$bodyAttr = 'class="landingPage"';
$workKey = basename(getcwd());
require $Root.'_phpCode/01_headLanding.php';
?>





<section class="hero-unit">
    <h1><span class="text-info">
        <?= $appTitle ?>
    </span></h1>
    <h2><?= $appTagline ?></h2>
</section>

<aside class="alert alert-info">
    <string>Wow!</string>
    Who would have known that random phrases would sound so suggestive?
</aside>

<a class="btn btn-large btn-block btn-primary" href="#">
    <i class="icon-play icon-white"></i>
    Play Now
</a>




<?php
require $Root.'_phpCode/10_end.php';
?>