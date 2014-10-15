<button id="myButton">Click me!</button>
<div id="myDiv">Hover over me!</div>

    <%--<script src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js" data-dojo-config="async: true" ></script> --%>

    <!-- blank.html is not yet defined in this application -->
<script data-dojo-config="async: 1, dojoBlankHtmlUrl: '/blank.html',
        packages: [ {
            name: 'demo',
            location: location.pathname.replace(/\/[^/]+$/, '') + '/resources/js/demo'
        } ]"
<%-- This is the compressed version for speed --%>
        src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js"></script>
            <%-- This is the uncompressed version for debugging --%>
            <%--src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js.uncompressed.js"></script>--%>
<script>
    require(["dojo/on", "dojo/dom", "dojo/dom-style", "dojo/mouse", "dojo/domReady!"],
            function (on, dom, domStyle, mouse) {
                var myButton = dom.byId("myButton"),
                        myDiv = dom.byId("myDiv");

                on(myButton, "click", function (evt) {
                    domStyle.set(myDiv, "backgroundColor", "blue");
                });
                on(myDiv, mouse.enter, function (evt) {
                    domStyle.set(myDiv, "backgroundColor", "red");
                });
                on(myDiv, mouse.leave, function (evt) {
                    domStyle.set(myDiv, "backgroundColor", "");
                });
            });

</script>

