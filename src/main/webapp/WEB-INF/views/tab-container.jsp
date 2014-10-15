
<%--
<div data-dojo-type="dijit/layout/TabContainer" class="tabbedContainer" >
<div data-dojo-type="dijit/layout/ContentPane" title="Simple Dojo">
--%>

<div id="tabContainer"></div>
<div id="contentPane1">
    <p>
        Message from the controller:
        <div id="greeting">${message}</div>
    </p>
</div>
<%--
<div data-dojo-type="dijit/layout/ContentPane" title="Simple Ajax" >
--%>
 <div id="contentPane2">
    <p>
        AJAX Message
        <div id="ajaxGet">loading...</div>
    </p>
</div>

    <%--<script src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js" data-dojo-config="async: true" ></script> --%>

    <!-- blank.html is not yet defined in this application -->
<script data-dojo-config="async: 1, dojoBlankHtmlUrl: '/blank.html', parseOnLoad: false,
        packages: [ {
            name: 'demo',
            location: location.pathname.replace(/\/[^/]+$/, '') + '/resources/js/demo'
        } ]"
    <%-- This is the compressed version for speed --%>
        src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js"></script>
    <%-- This is the uncompressed version for debugging --%>
    <%--src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js.uncompressed.js"></script>--%>
<script>
    require(["dojo/dom", "dojo/parser", "dijit/layout/TabContainer", "dijit/layout/ContentPane", "dojo/domReady!"],
            function (dom, parser, TabContainer, ContentPane) {
                var tabContainer = new TabContainer({style: "height: 20em;"}, "tabContainer");
                var contentpane1 = new ContentPane({title: "Simple Dojo", content: dom.byId("contentPane1")});
                tabContainer.addChild(contentpane1);
                var contentpane2 = new ContentPane({title: "Simple Ajax", content: dom.byId("contentPane2")});
                tabContainer.addChild(contentpane2);
                tabContainer.startup();

                //parser.parse();
            });
</script>
<script>
    // Require the module we just created
    require(["demo/myModule"], function (myModule) {
        // Use our module to change the text in the greeting
        myModule.setText("greeting", "Hello Dojo!");

        // After a few seconds, restore the text to its original state
        setTimeout(function () {
            myModule.restoreText("greeting");
        }, 3000);
    });

</script>
<script>
    require(["dojo/dom", "dojo/request", "dojo/json",
        "dojo/_base/array", "dojo/domReady!"], function (dom, request, JSON, arrayUtil) {
        // Put the response in the DOM
        var resultDiv = dom.byId("ajaxGet");

        // Request the JSON data from the server
        request.get("tab-container/example-data", {
            // Parse data from JSON to a JavaScript object
            handleAs: "json"
        }).then(function (data) {
                    // Display the data sent from the server
                    resultDiv.innerHTML = data.status;
                },
                function (error) {
                    // Display the error returned
                    resultDiv.innerHTML = error;
                });
    });
</script>

