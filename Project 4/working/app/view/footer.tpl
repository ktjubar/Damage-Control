</div>
<div id="footer">
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div class="foot-links text-center">
          <a href="<?= BASE_URL ?>">Home</a> |
          <a href="<?= BASE_URL ?>/crews/">Crews</a> |
          <a href="<?= BASE_URL ?>/soldiers/">Soldiers</a> |
          <a href="<?= BASE_URL ?>/maps/">Map</a>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="foot-links text-center">
          <p>&#169; Damage Control 2018</p>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="foot-links text-center">
          <p>212-479-7990
            <br /> 1600 Amphitheatre Parkway
            <br /> Mountain View, CA 94043 USA
            <br />
          </p>
        </div>
      </div>
    </div>
  </div>
</div>
<div id="push"></div>

<script src="<?= BASE_URL ?>/public/js/blueimp-gallery.min.js"></script>
<script>
  document.getElementById('links').onclick = function (event) {
    event = event || window.event;
    var target = event.target || event.srcElement,
      link = target.src ? target.parentNode : target,
      options = { index: link, event: event },
      links = this.getElementsByTagName('a');
    blueimp.Gallery(links, options);
  };
</script>
<script>
  blueimp.Gallery(
    document.getElementById('links').getElementsByTagName('a'),
    {
      container: '#blueimp-gallery-carousel',
      carousel: true
    }
  );
</script>
</body>

</html>