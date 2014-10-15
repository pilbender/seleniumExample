<h3 id="greeting">Hello</h3>

<!-- load Dojo -->
<script src="http://ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js"
        data-dojo-config="async: true"></script>

<script>
    require([
        'dojo/dom',
        'dojo/dom-construct',
        'dojo/domReady!'
    ], function (dom, domConstruct) {
        var greetingNode = dom.byId('greeting');
        domConstruct.place('<i> Dojo!</i>', greetingNode);
    });
</script>