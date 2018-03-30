<h3>
    <?= $s->last_name.", ".$s->first_name ?>
</h3>
<div class="col-sm-3">
    <?php if(isset($_SESSION['username'])): ?>
    <form action="<?= BASE_URL ?>/soldiers/edit/<?= $s->id ?>">
        <button type="submit" class="btn btn-default btn-block" value="Add">Edit</button>
    </form>
    <?php endif ?>
</div>