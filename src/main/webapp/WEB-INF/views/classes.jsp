<p>Classes</p>
<button data-dojo-type="dijit/form/Button" type="button" class="tundra" >
    <span>Click</span>
    <script type="dojo/on" data-dojo-event="click" data-dojo-args="e">
    console.log("I was clicked!", e);
    this.set("label", "Clicked!");
    </script>
    <script type="dojo/watch" data-dojo-prop="label" data-dojo-args="prop, oldValue, newValue">
    console.log("button: " + prop + " changed from '" + oldValue + "' to '" + newValue + "'");
    </script>
</button>
<p>Enable logging to see class scope output.</p>

<script data-dojo-config="async: 1, dojoBlankHtmlUrl: '/blank.html',
        packages: [ {
            name: 'demo',
            location: location.pathname.replace(/\/[^/]+$/, '') + '/resources/js/demo',
         } ]"
<%-- This is the compressed version for speed --%>
        src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js"></script>
<%-- This is the uncompressed version for debugging --%>
<%--src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js.uncompressed.js"></script>--%>
<script>
    require([
        "demo/classes"
    ], function() {

    });

    require([
            "demo/customButtonClass"
    ]), function (MyButton) {
        //var MyButton = new MyButton();
    }

    // TODO: Fix this so it works (console.log) when you press the button and adds the label
    // Hook a button after the dom loads via a class.

    require([
        "demo/classScope"
    ], function() {
       // Nothing, everything is in the classScope.js and executed there.
    });

</script>