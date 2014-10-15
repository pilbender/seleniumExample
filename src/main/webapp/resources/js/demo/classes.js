// Classes, inheritance and instantiation

// Explain why this is here, remember only "define" and "require" are available by default.
require(["dojo/_base/declare"], function (declare) {

	// Create a new class named "mynamespace.MyClass", no inheritance
	declare("mynamespace.MyClass", null, {

		// Custom properties and methods here

	});

	// Create a scoped, anonymous class, no inheritance
	var MyClass = declare(null, {

		// Custom properties and methods here

	});

	// Class with inheritance from MyClass
	var MySubClass = declare(MyClass, {

		// MySubClass now has all of MyClass's properties and methods
		// These properties and methods override parent's

	});

	var MyOtherClass = declare(null, {});
	var MyMixinClass = declare(null, {});

	// Class with multiple inheritance, MyOtherClass and MyMixinClass are mixins.
	// MySubClass is the base prototype.  In the event of a naming collision, the last
	// one specified wins.
	var MyMultiSubClass = declare([
		MySubClass,
		MyOtherClass,
		MyMixinClass
	], {

		// MyMultiSubClass now has all of the properties and methods from:
		// MySubClass, MyOtherClass, and MyMixinClass

	});

	// Create a new class with declare
	// Basic class instance creation
	var Twitter = declare(null, {
		// The default username
		username: "defaultUser",

		// The constructor
		constructor: function (args) {
			declare.safeMixin(this, args);
		}
	});
	// Create 2 instances of this new class, one without setting anything,
	// one with setting a new instances state.
	var myInstance1 = new Twitter();
	var myInstance2 = new Twitter({
		username: "sitepen"
	});

});
