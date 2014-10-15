// Classes scope behavior

require(["dojo/_base/declare"], function (declare) {
	console.log("declare MyClass");
	console.log("primitiveVal: 5");
	console.log("objectVal: [1, 2, 3]");
	var MyClass = declare(null, {
		primitiveVal: 5,
		objectVal: [1, 2, 3]
	});

	console.log("Create the obj1 and obj2 instances of MyClass");
	var obj1 = new MyClass();
	var obj2 = new MyClass();

	// both return the same value from the prototype
	console.log("Verify Values of each object");
	console.log("obj1 primitive === 5"); // true
	console.log(obj1.primitiveVal === 5); // true
	console.log("obj2 primitive === 5"); // true
	console.log(obj2.primitiveVal === 5); // true

	console.log("obj2 gets its own property (prototype remains unchanged)");
	console.log("obj2.primitiveVal = 10");
	console.log(obj2.primitiveVal = 10);

	console.log("obj1 still gets its value from the prototype");
	console.log("obj1.primitiveVal === 5"); // true
	console.log(obj1.primitiveVal === 5); // true
	console.log("obj2.primitiveVal === 10"); // true
	console.log(obj2.primitiveVal === 10); // true

	console.log("both point to the array on the prototype,");
	console.log("neither instance has its own array at this point");
	console.log("obj1.objectVal === obj2.objectVal"); // true
	console.log(obj1.objectVal === obj2.objectVal); // true

	console.log("obj2 manipulates the prototype's array");
	console.log("obj2.objectVal.push(4)");
	console.log(obj2.objectVal.push(4));
	console.log("obj2's manipulation is reflected in obj1 since the array");
	console.log("is shared by all instances from the prototype");
	console.log("obj1.objectVal.length === 4"); // true
	console.log(obj1.objectVal.length === 4); // true
	console.log("obj1.objectVal[3] === 4"); // true
	console.log(obj1.objectVal[3] === 4); // true

	console.log("only assignment of the property itself (not manipulation of object properties)");
	console.log("creates an instance-specific property");
	console.log("obj2.objectVal = []");
	console.log(obj2.objectVal = []);
	console.log("obj1.objectVal === obj2.objectVal"); // false
	console.log(obj1.objectVal === obj2.objectVal); // false

	// To avoid inadvertently sharing arrays or objects among all instances,
	// object properties should be declared with null values and initialized
	// in the constructor function:
	declare(null, {
		// not strictly necessary, but good practice
		// for readability to declare all properties
		memberList: null,
		roomMap: null,

		constructor: function () {
			// initializing these properties with values in the constructor
			// ensures that they ready for use by other methods
			// (and are not null or undefined)
			this.memberList = [];
			this.roomMap = {};
		}
	});

	// Inherited arguments, this.inherited can be called anywhere but should not
	// be called from the constructor.
	// Define class A
	var A = declare(null, {
		myMethod: function () {
			console.log("Stuff from class A");
		}
	});

	// Define class B
	var B = declare(A, {
		myMethod: function () {
			// Call A's myMethod
			this.inherited(arguments); // arguments provided to A's myMethod
			console.log("Stuff from class B");
		}
	});

	console.log("Create an instance of B");
	console.log("var myB = new B()");
	var myB = new B();
	console.log("myB.myMethod()");
	myB.myMethod();


	// Would output:
	//      Stuff from class A
	//      Stuff from class B

});
