<?php
$Root = '../../../';
$appTitle = "Re-Live";
$appTagline = "Always Remember the Best Times";
$pageTitle = $appTitle.' - An Application from Simple.Gy';
$bodyAttr = 'class="landingPage dark"';
$workKey = basename(getcwd());
require $Root.'_phpCode/01_headLanding.php';
?>

<section class="hero-unit">
    <h1>
        <?= $appTitle ?>
    </h1>
    <h2 class="text-success"><?= $appTagline ?></h2>
</section>

<p>
    Always remember the best concerts and shows you've been to.
</p>
<p>
    Here you can relive any show and find videos and pictures from the event. You can also read and participate in the discussion surrounding the event.
</p>
<a class="btn btn-large btn-block btn-success" href="#">
    <i class="icon-flag icon-white"></i>
    Get Started
</a>

<ol>
    <li>Choose an Event</li>
    <li>Re-Live the Experience</li>
    <li>Contribute your own Memories</li>
</ol>

<?php
require $Root.'_phpCode/10_end.php';
?>