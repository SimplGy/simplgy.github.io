<?php
$Root = '../../../';
$appTitle = "ToGo";
$appTagline = "The Easiest Way to Accept Text Message Orders";
$pageTitle = $appTitle.' - An Application from Simple.Gy';
$bodyAttr = 'class="landingPage"';
$workKey = basename(getcwd());
require $Root.'_phpCode/01_headLanding.php';
?>





<section class="hero-unit">
    <h1>
        <span class="text-info">
            <?= $appTitle ?> <small>Text Ordering</small>
        </span>
    </h1>
    <h2><?= $appTagline ?></h2>
</section>
<a class="btn btn-large btn-block btn-info" href="#">
    <i class="icon-check"></i>
    Get Started
</a>

<aside class="alert alert-info">
    <string>Sweet!</string>
    Finally a way to get my employees off the phone, but still receive orders.
</aside>

<div class="row">
    <aside class="span6">
        <strong class="text-warning">45 Seconds</strong> per phone order:
        <div class="progress progress-warning">
            <div class="bar" style="width: 75%"></div>
        </div>
        <strong class="text-success">15 Seconds</strong> Time Per Order with ToGo Text Ordering
        <div class="progress progress-success">
            <div class="bar" style="width: 25%"></div>
        </div>
    </aside>
</div>






<h2>Save Time</h2>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

<h2>Add Revenue</h2>
<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>







<?php
require $Root.'_phpCode/10_end.php';
?>