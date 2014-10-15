// Custom button Class which inherits from dijit/form/Button

require(["dojo/parser", "dojo/domReady!"], function(parser){
	parser.parse();
});

require([
	"dojo/_base/declare",
	"dijit/_WidgetBase",
	"dijit/form/Button",
	"dojo/on", // Events
	"dojo/mouse"
], function (declare, Button, on, dom) {
	var MyButton = declare(Button, {
		constructor: function () {
			label: "My Button",
				on(dom.byId("log-it"), "click", function (evt) {
					console.log("I was clicked!");
					this.inherited(arguments);
				});

		} // End constructor
	}); // End MyButton
});