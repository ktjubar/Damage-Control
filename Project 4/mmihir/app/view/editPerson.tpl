<div id="contentHolder">
    <link rel="stylesheet" href="<?= BASE_URL ?>/public/css/add-view.css">
    <script src="<?= BASE_URL ?>/public/js/add-view.js"></script>
    <script src="<?= BASE_URL ?>/public/js/add-verify.js"></script>
    <div>
        <h2 style="display: inline-block; width:45%">Add Person</h2>
        <a class="add" style="color: #000; display: inline-block; width:45%; text-align: right" href="<?= BASE_URL ?>/family/">Cancel</a>
    </div>
    <form action="<?= BASE_URL ?>/family/add/process/<?= $person->id?>" method="POST" enctype="multipart/form-data">
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
                <input name="image" type="file" style="display: inline-block";>
            </div>
            <br>
            <input type="submit" name="submit" value="Save &amp; Add">
        </aside>
        <section id="info-container" class="infoHolder">
            <h3>Profile Information:</h3>
            <section class="infoTop">
                <h3>General Info:</h3>
                <div class="colInput">
                    <p>First name:
                        <br />
                        <input name="first" type="text" style="width: 80%" value="<?= $person->first_name; ?>">
                    </p>
                    <p>Middle name:
                        <br />
                        <input name="middle" type="text" style="width: 80%" value="<?= $person->middle_name; ?>">
                    </p>
                    <p>Last name:
                        <br />
                        <input name="last" type="text" style="width: 80%" value="<?= $person->last_name; ?>">
                    </p>
                </div>
                <div class="colInput">
                    <p>Born:
                        <br />
                        <input name="dob" type="date" style="width: 80%" value="<?= $person->birthday; ?>">
                    </p>
                    <p>Gender:
                        <br />
                        <?php
                        $selected_m = ($person->gender == 'Male') ? "selected" : '' ;
                        $selected_f = ($person->gender == 'Male') ? "selected" : '' ; ?>
                        <select name="gender" style="width: 80%">
                            <option selected="<?php echo $selected_m ?>" value="Male">Male</option>
                            <option selected="<?php echo $selected_f ?>" value="Female">Female</option>
                        </select>
                    </p>
                </div>
                <div class="colInput">
                    <p>
                        Deceased:
                        <br />
                        <input name="dod" type="date" style="width: 80%" value="<?= $person->deathday; ?>">
                    </p>
                    <p>
                        Married:
                        <br />
                        <input name="dom" type="date" style="width: 80%" value="<?= $person->married; ?>">
                    </p>
                </div>
            </section>
        </section>
    </form>

</div>