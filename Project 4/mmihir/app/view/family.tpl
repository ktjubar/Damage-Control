<link rel="stylesheet" href="/public/css/family.css">
<script src="/public/js/family.js"></script>
<div id="contentHolder">
    <h2>Family</h2>
    <div id="grid-container" class="grid">
        <?php foreach($family as $person): ?>
        <div class="grid-item">
            <div class="card">
                <a href="<?= BASE_URL ?>/family/view/<?= $person->id ?>">
                    <?php if($person->picture_file != NULL): ?>
                    <img id="profilePicture" src="/public/img/<?= $person->picture_file?>" alt="Headshot Picture" />
                    <?php else: ?>
                    <img id="profilePicture" src="/public/img/default.png" alt="Headshot Picture" />
                    <?php endif; ?>
                </a>
            </div>
            <div class="profile">
                <p>
                    <?= $person->first_name ?>
                        <?= $person->last_name ?>
                </p>
                <p>Born:
                    <?= $person->birthday ?>
                </p>
                <p>Died:
                    <?= $person->deathday ?>
                </p>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
</div>