<label for="city">City:</label>
<input id="city" />
<label for="state">State:</label>
<input id="state" />

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

<script type="text/javascript">
    var stateDtos;
    var cityDtos;

    require(["dojo/dom", "dojo/request", "dojo/json",
        "dojo/_base/array", "dojo/domReady!"], function (dom, request, JSON, arrayUtil) {
        // Request the JSON data from the server
        request.get("${pageContext.servletContext.contextPath}/filtering-select/states", {
            // Parse data from JSON to a JavaScript object
            handleAs: "json"
        }).then(function (data) {
                    // For variable scoping
                    stateDtos = data;
                },
                function (error) {
                    // Display the error returned
                });

        // Request the JSON data from the server
        request.get("${pageContext.servletContext.contextPath}/filtering-select/cities", {
            // Parse data from JSON to a JavaScript object
            handleAs: "json"
        }).then(function (data) {
                    // For variable scoping
                    cityDtos = data;
                },
                function (error) {
                    // Display the error returned
                });
    });

    require([
        "dojo/store/Memory",
        "dijit/form/ComboBox", "dijit/form/FilteringSelect",
        "dojo/domReady!"
    ], function (Memory, ComboBox, FilteringSelect) {

        new dijit.form.ComboBox({
            id: "city",
            store: new Memory({ data: cityDtos }),
            autoComplete: true,
            query: {state: /.*/},
            style: "width: 150px;",
            required: true,
            searchAttr: "name",
            onChange: function (city) {
                console.log("combobox onchange ", city, this.item);
                dijit.byId('state').set('value', this.item ? this.item.state : null);
            }
        }, "city").startup();

        new dijit.form.FilteringSelect({
            id: "state",
            store: new Memory({ idProperty: "state", data: stateDtos }),
            autoComplete: true,
            style: "width: 150px;",
            onChange: function (state) {
                dijit.byId('city').query.state = this.item.state || /.*/;
            }
        }, "state").startup();
    });
</script>

