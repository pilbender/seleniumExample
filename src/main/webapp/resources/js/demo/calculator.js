// In demo/myModule.js (which means this code defines
// the "demo/myModule" module):

define([
	// The dojo/dom module is required by this module, so it goes
	// in this list of dependencies.
	"dojo/dom",
	"dojo/on", // Events
	"dojo/mouse"
], function(dom, on, mouse){
	// Once all modules in the dependency list have loaded, this
	// function is called to define the demo/myModule module.
	//
	// The dojo/dom module is passed as the first argument to this
	// function; additional modules in the dependency list would be
	// passed in as subsequent arguments.

	// Private variable protected by a closure.  Only methods inside the closure can
	// access it.
	var oldText = {};

	// This returned object becomes the defined value of this module
	return {
		setText: function(id, text){
			var node = dom.byId(id);
			oldText[id] = node.innerHTML;
			node.innerHTML = text;
		},

		calculate: function(inputId, outputId, calculate) {
			var inputNode = dom.byId(inputId);
			var outputNode = dom.byId(outputId);
			var calculateNode = dom.byId(calculate);
			on(calculateNode, "click", function (evt) {
				outputNode.innerHTML = inputNode.value * 2;
			});
		}
	};
});