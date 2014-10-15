<h3 id="greeting">Hello</h3>

<!-- load Dojo -->
<script src="http://ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js"
        data-dojo-config="async: true"></script>

<script>
    require([
        'dojo/dom',
        'dojo/fx',
        'dojo/domReady!'
    ], function (dom, fx) {
        // The piece we had before...
        var greeting = dom.byId('greeting');
        greeting.innerHTML += ' from Dojo!';

        // ...but now, with an animation!
        fx.slideTo({
            node: greeting,
            top: 100,
            left: 400,
            duration: 2000
        }).play();
    });
</script>