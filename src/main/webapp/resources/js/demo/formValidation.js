// Form validation checks
require(["dojo/dom",
	"dojo/parser",
	"dojo/_base/array",
	"dojo/_base/event",
	"dojo/query",
	"dojox/validate",
	"dojox/validate/us",
	"dojox/validate/check",
	"dojox/validate/web"
], function (dom, parser, arrayUtil, baseEvent, query, validate) {
	return {
		validateForm: function () {
			// Parse the page
			parser.parse();

			//	wait until after our requires are actually loaded.
			var profile = {
				trim: ["firstName", "lastName"],
				required: ["firstName", "lastName", "email", "emailConfirm", "password", "password2"],
				constraints: {
					firstName: validate.isText,
					lastName: validate.isText,
					password: validate.isText,
					password2: validate.isText,
					email: [validate.isEmailAddress, false, true],
					emailConfirm: [validate.isEmailAddress, false, true],
					phone: validate.us.isPhoneNumber
				},
				confirm: {
					"emailConfirm": "email",
					"password2": "password"
				}
			};

			//  later on in the app, probably onsubmit on the form:
			var results = validate.check(document.getElementById, profile);

			function doCheck(form) {
				var results = validate.check(form, profile),
					r = dom.byId("result");

				if (results.isSuccessful()) {
					//	everything passed, log it to the result div
					r.innerHTML = "Everything passed validation!";
				} else {
					var s = "";
					var missing = results.getMissing();
					if (missing.length) {
						s += '<h4>The following fields are missing:</h4>'
							+ '<ol>';
						arrayUtil.forEach(missing, function (field) {
							s += '<li>' + field + '</li>';
						});
						s += '</ol>';
					}

					var invalid = results.getInvalid();
					if (invalid.length) {
						s += '<h4>The following fields are invalid:</h4>'
							+ '<ol>';
						arrayUtil.forEach(invalid, function (field) {
							s += '<li>' + field + '</li>';
						});
						s += '</ol>';
					}

					r.innerHTML = s;
				}
			}

			//	set up the form handler.
			var f = query("form")[0];
			f.onsubmit = function (e) {
				baseEvent.stop(e);
				doCheck(f);
			};
		}
	};
});