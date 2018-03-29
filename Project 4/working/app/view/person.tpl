<link rel="stylesheet" href="<?= BASE_URL ?>/public/css/add-view.css">
<script src="<?= BASE_URL ?>/public/js/add-view.js"></script>
<div id="contentHolder">
    <div>
        <h2 style="display: inline-block; width:45%">View Person</h2>
        <?php if(isset($_SESSION['username'])): ?>
        <a class="edit" style="color: #000; display: inline-block; width:45%; text-align: right" href="<?= BASE_URL ?>/family/edit/<?= $person->id ?>">Edit</a>
        <?php endif; ?>
    </div>
    <aside id="picture-container" class="pictureHolder">
        <h3>Profile Picture:</h3>
        <br>
        <br>
        <?php if($person->picture_file != NULL): ?>
        <img id="profilePicture" src="<?= BASE_URL ?>/public/img/<?= $person->picture_file?>" alt="Headshot Picture" />
        <?php else: ?>
        <img id="profilePicture" src="<?= BASE_URL ?>/public/img/default.png" alt="Headshot Picture" />
        <?php endif; ?>
        <br>
        <br>
        <div class="pictureControls" style="width: 60%">
        </div>
    </aside>
    <section id="info-container" class="infoHolder">
        <h3>Profile Information:</h3>
        <section class="infoTop">
            <h3>General Info:</h3>
            <div class="colInput">
                <p>First name:
                    <br /><?= $person->first_name ?></p>
                <p>Middle name:
                    <br /><?= $person->middle_name ?></p>
                <p>Last name:
                    <br /><?= $person->last_name ?></p>
            </div>
            <div class="colInput">
                <p>Born:
                    <br /><?= $person->birthday ?></p>
                <p>Gender:
                    <br /><?= $person->gender ?></p>
            </div>
            <div class="colInput">
                <p>
                    Deceased:
                    <?php if($person->deathday != NULL): ?>
                    <br /><?= $person->deathday ?></p>
                    <?php else: ?>
                    <br />N/A</p>
                    <?php endif;?>
                <p>
                    Married:
                    <?php if($person->married != NULL): ?>
                    <br /><?= $person->married ?></p>
                    <?php else: ?>
                    <br />N/A</p>
                    <?php endif;?>
            </div>
        </section>
    </section>
</div>