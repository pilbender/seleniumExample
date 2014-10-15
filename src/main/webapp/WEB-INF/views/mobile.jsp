<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <title>Your Application Name</title>
    <!-- stylesheet will go here -->
    <script type="text/javascript"
            src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojox/mobile/deviceTheme.js"></script>

</head>
<!-- ensure that the page is only displayed when all mobile widgets are rendered. -->
<body style="visibility:hidden;">
<!-- the view or "page"; select it as the "home" screen -->
<div id="settings" data-dojo-type="dojox/mobile/View" data-dojo-props="selected:true">
    <!-- a sample heading -->
    <h1 data-dojo-type="dojox/mobile/Heading">"Homepage" View</h1>
    <!-- a rounded rectangle list container -->
    <ul data-dojo-type="dojox/mobile/RoundRectList">
        <!-- list item with an icon containing a switch -->
        <li data-dojo-type="dojox/mobile/ListItem" data-dojo-props="icon:'${pageContext.servletContext.contextPath}/resources/images/icon-1.png'">Airplane Mode
            <!-- the switch -->
            <div data-dojo-type="dojox/mobile/Switch"></div>
        </li>
        <!-- list item with an icon that slides this view away and then loads another page -->
        <li data-dojo-type="dojox/mobile/ListItem" data-dojo-props="icon:'${pageContext.servletContext.contextPath}/resources/images/icon-2.png', rightText:'mac'">Wi-Fi</li>
        <!-- list item with an icon that slides to a view called "general" -->
        <li data-dojo-type="dojox/mobile/ListItem" data-dojo-props="icon:'${pageContext.servletContext.contextPath}/resources/images/icon-3.png', rightText:'AcmePhone', moveTo:'general'">Carrier</li>
    </ul>
</div>

<!-- The "General" sub-page -->
<div id="general" data-dojo-type="dojox/mobile/View">
    <!-- a sample heading -->
    <h1 data-dojo-type="dojox/mobile/Heading" data-dojo-props="back:'Settings', moveTo:'settings'">General View</h1>
    <!-- a rounded rectangle list container -->
    <ul data-dojo-type="dojox/mobile/RoundRectList">
        <li data-dojo-type="dojox/mobile/ListItem" data-dojo-props="moveTo:'about'">About</li>
        <li data-dojo-type="dojox/mobile/ListItem" data-dojo-props="rightText:'2h 40m', moveTo:'about'">Usage</li>
    </ul>
</div>
<!-- And let's add another view "About" -->
<div id="about" data-dojo-type="dojox/mobile/View">
    <!-- Main view heading -->
    <h1 data-dojo-type="dojox/mobile/Heading" data-dojo-props="back:'General', moveTo:'general'">About</h1>
    <!-- subheading -->
    <h2 data-dojo-type="dojox/mobile/RoundRectCategory">Generic Mobile Device</h2>
    <!-- a rounded rectangle list container -->
    <ul data-dojo-type="dojox/mobile/RoundRectList">
        <li data-dojo-type="dojox/mobile/ListItem" data-dojo-props="rightText:'AcmePhone'">Network</li>
        <li data-dojo-type="dojox/mobile/ListItem" data-dojo-props="rightText:'AcmePhone'">Line</li>
        <li data-dojo-type="dojox/mobile/ListItem" data-dojo-props="rightText:'1024'">Songs</li>
        <li data-dojo-type="dojox/mobile/ListItem" data-dojo-props="rightText:'10'">Videos</li>
    </ul>
</div>

<!-- dojo/javascript will go here -->
<script src="http://ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js"
        data-dojo-config="async: true"></script>
<!-- application will go here -->
<script type="text/javascript">
    require([
        "dojox/mobile/parser",
        "dojox/mobile/compat", // Not necessary but a best practice and does not degrade mobile performance
        "dojox/mobile/View",
        "dojox/mobile/Heading",
        "dojox/mobile/RoundRectList",
        "dojox/mobile/RoundRectCategory",
        "dojox/mobile/ListItem",
        "dojox/mobile/Switch",
        "dojo/domReady!"
    ], function (parser) {
        // now parse the page for widgets
        parser.parse();
    });
</script>
</body>
</html>
