<div class="col-sm-1">
    <form action="<?= BASE_URL ?>/soldiers/add/process/" method="POST">
        <input type="text" placeholder="First name" name="first" required>
        <input type="text" placeholder="Last name" name="last" required>
        <button type="submit" class="btn btn-default btn-block" value="Add">Add</button>
    </form>
    <form action="<?= BASE_URL ?>/soldiers/">
        <button type="submit" class="btn btn-default btn-block" value="Cancel">Cancel</button>
    </form>
</div>

<p>
    Back end needs the following in POST:
    <br> $firstName = $_POST['first']; // required
    <br> $middleName = $_POST['middle'];
    <br> $lastName = $_POST['last']; // required
    <br> $birth = $_POST['dob'];
    <br> $death = $_POST['dod'];
    <br> $crew = $_POST['crew'];
    <br> Creator ID hardcoded for now
    <br> Date created auto generated (maybe)
</p>