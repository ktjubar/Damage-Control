<div id="contentHolder">
    <script src="home.js"></script>
    <link rel="stylesheet" href="home.css">
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