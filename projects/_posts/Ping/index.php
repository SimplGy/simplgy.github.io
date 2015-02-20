<?php
$Root = '../../../';
$appTitle = "Ping";
$appTagline = "Find Nearby Folks with Common Interests";
$pageTitle = $appTitle.' - An Application from Simple.Gy';
$bodyAttr = 'class="landingPage"';
$workKey = basename(getcwd());
require $Root.'_phpCode/01_headLanding.php';
?>

<section class="hero-unit">
    <h1>
        <span class="text-error"><?= $appTitle ?></span>
    </h1>
    <h2><?= $appTagline ?></h2>
</section>

<p>

</p>

<a class="btn btn-large btn-block btn-danger" href="#">
    <i class="icon-circle-arrow-down icon-white"></i>
    Download the App
</a>
<ul>
    <li>Nearest and Freshest Rank Highest</li>
    <li>System keeps track of common Ping terms</li>
    <li>Synonyms should be considered</li>
</ul>


<?php
require $Root.'_phpCode/10_end.php';
?>