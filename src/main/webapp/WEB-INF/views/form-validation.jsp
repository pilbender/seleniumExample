<form>
    <div>
        <label for="firstName">First Name*</label>
        <input type="text" name="firstName" id="firstName" value="" />
    </div>
    <div>
        <label for="lastName">Last Name*</label>
        <input type="text" name="lastName" id="lastName" value="" />
        <div>
        </div>
        <label for="email">Email Address*</label>
        <input type="text" name="email" id="email" value="" />
    </div>
    <div>
        <label for="emailConfirm">Confirm Email*</label>
        <input type="text" name="emailConfirm" id="emailConfirm" value="" />
    </div>
    <div>
        <label for="password">Password*</label>
        <input type="password" name="password" id="password" value="" />
    </div>
    <div>
        <label for="password2">Confirm Password*</label>
        <input type="password" name="password2" id="password2" value="" />
    </div>
    <div>
        <label for="phone">Phone</label>
        <input type="text" name="phone" id="phone" value="" />
    </div>
    <input type="submit" value="Post!" />
</form>

<h3>Form Validation Results</h3>
<div id="result" ></div>

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
    <%--
    require(["demo/formValidation"], function (formValidation) {
        console.debug("Begin Form Validation");
        formValidation.validateForm();
        console.debug("End Form Validation");
    });
    --%>

    require(["dojo/dom",
                "dojo/_base/array",
                "dojo/_base/event",
                "dojo/query",
                "dojox/validate/web",
                "dojox/validate/us",
                "dojox/validate/check",
                "dojo/domReady!"],
            function (dom, arrayUtil, baseEvent, query, validate) {

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

                //	wait until after our requires are actually loaded.
                profile = {
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

                //	set up the form handler.
                var f = query("form")[0];
                f.onsubmit = function (e) {
                    baseEvent.stop(e);
                    doCheck(f);
                };
            });
</script>

