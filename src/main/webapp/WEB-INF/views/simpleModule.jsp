<p>Simple Module</p>
<p>This doesn't appear to do much, enable console debugging in your browser to see what is happening.</p>

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
    require([
        "demo/simpleModule"
    ], function(counter){
        console.debug("Begin First Module Usage");
        console.debug(counter.getValue());
        counter.increment();
        console.debug(counter.getValue());
        counter.increment();
        console.debug(counter.getValue());
        counter.decrement();
        console.debug(counter.getValue());
        console.debug("End First Module Usage");
    });

    require(["demo/simpleModule"], function (counter) {
        console.debug("Begin Second Module Usage");
        console.debug(counter.getValue());
        counter.increment();
        console.debug(counter.getValue());
        console.debug("End Second Module Usage");
    });
</script>