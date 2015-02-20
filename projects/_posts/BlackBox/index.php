<?php
$Root = '../../../';
$appTitle = "BlackBox";
$appTagline = "Always on the Record";
$pageTitle = $appTitle.' - An Application from Simple.Gy';
$bodyAttr = 'class="landingPage dark"';
$workKey = basename(getcwd());
require $Root.'_phpCode/01_headLanding.php';
?>

<section class="hero-unit">
    <h1>
        <?= $appTitle ?>
    </h1>
    <h2 class="text-warning"><?= $appTagline ?></h2>
</section>

<p>

</p>

<a class="btn btn-large btn-block btn-warning" href="#">
    <i class="icon-ok icon-white"></i>
    Get Started
</a>



<?php
require $Root.'_phpCode/10_end.php';
?>