<div id="contentHolder">
    <script src="<?= BASE_URL ?>/public/js/home.js"></script>
    <link rel="stylesheet" href="<?= BASE_URL ?>/public/css/home.css">
    <h2>Login</h2>
    <form method="POST" action="<?= BASE_URL ?>/login/process/">
        <label>Username
            <input type="text" name="username" value="">
        </label>
        <label>Password
            <input type="password" name="pw" value="">
        </label>
        <input type="submit" name="submit" value="Login">

    </form>

</div>