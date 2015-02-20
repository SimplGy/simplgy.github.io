<?php
$Root = '../../../';
$appKey = "workingLunch";
$appTitle = "Working Lunch";
$appTagline = "We're Helping<br/>Your Employees<br/>Get to Know<br/>Each Other";
$pageTitle = $appTitle.' - An Application from Simple.Gy';
$bodyAttr = 'class="landingPage"';
$workKey = basename(getcwd());
require $Root.'_phpCode/01_headCustomLanding.php';
?>

<h5 class='title'>
    <i class="icon-food"></i>
    Working Lunch
</h5>


<section class="hero-unit">
    <h1><?= $appTagline ?></h1>

    <div class="callToAction">

        <p>Use lunch to get folks in your organization talking between departments.</p>
        <p>Create synergies where they never existed before.</p>

        <h3>Early Access Program</h3>

        <form action="<?= $Root ?>api.php" class="input-append" id="SignUp">
            <input name="email" type="email" class="large" placeholder="Your Email Address"/>
            <input name="appKey" type="hidden" value="<?= $appKey ?>"/>
            <button type="submit" class="btn btn-large btn-warning">
                <i class="icon-ok"></i>
                Get Notified
            </button>
        </form>
        <p class="muted">As a member of the early access program, you'll be notified first when it's ready.</p>
    </div>
</section>


<article class="perks">
    <div class="perk">
        <h4>Strangers at a Cocktail Party?</h4>
        <i class="icon-group icon-3x pull-left"></i>
        <p>As your organization grows, keeping employees connected with each other can be a challenge. Lunch is a natural way to make a personal and professional connection.</p>
    </div>

    <div class="perk">
        <h4>Improve Cross-Departmental Communication</h4>
        <i class="icon-comments icon-3x pull-left"></i>
        <p>We gameify pursuing lunch with employees from different departments, so people are encouraged to expand their horizons.</p>
    </div>

    <div class="perk">
        <h4>Enhance Company Culture</h4>
        <i class="icon-trophy icon-3x pull-left"></i>
        <p>Employees that get along are happier, more productive, and stay committed to your organization.</p>
    </div>

    <div class="perk">
        <h4>It's All Up to You</h4>
        <i class="icon-thumbs-up icon-3x pull-left"></i>
        <p>We don't know exactly what we're going to build yet, and that's a good thing. We want you to help us build something you'll love.</p>
    </div>
</article>

<footer>
    An application from <a href="mailto:hi@simple.gy">Simple Guy</a>.
</footer>

<script src="<?= $Root ?>_lib/landingPage.js"></script>

<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-18128685-2']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>

<?php
require $Root.'_phpCode/10_end.php';
?>