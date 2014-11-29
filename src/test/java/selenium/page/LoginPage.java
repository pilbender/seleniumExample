package selenium.page;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Encapsulates logins, so it only has to be implemented once. Call this service from Selenium tests
 * to log in.
 *
 * @author Richard Scott Smith <scott.smith@isostech.com>
 */

@Component
public class LoginPage {
	private static final Logger logger = LoggerFactory.getLogger(LoginPage.class);

    public static final String relativePathLogin = "login";

	public static final String usernameId = "username";
	public static final String passwordId = "password";
	public static final String rememberMeId = "rememberMe";
	public static final String loginButtonId = "loginSubmitButton";
	public static final String forgotPasswordId = "forgot_password";
	public static final String acknowledgementCheckId = "acknowledgementCheck";
	public static final String agreementId = "argreesubmitbtn";

	public static final String logoutText = "Logout";
	
	@Value(value = "#{selenium['base.url']}")
	String baseUrl;

	@Autowired WebDriver webDriver;
	@Autowired WebDriverWait webDriverWait;

	public void login(String username, String password, Boolean rememberMe) throws InterruptedException {
		webDriverWait.until(ExpectedConditions.visibilityOfElementLocated(By.id(usernameId)));
		webDriver.findElement(By.id(usernameId)).sendKeys(username);
		webDriver.findElement(By.id(passwordId)).sendKeys(password);
		if (rememberMe) {
			webDriver.findElement(By.name(rememberMeId)).click();
		}
        /* The login page has developed an issue where you actually need to click the login button twice when the browser
         * is first brought up.  That makes no sense, but clicking twice gets us by for now.  This only appears to happen
         * when the browser is first opened and it does not help to simply wait.  It needs to be clicked twice the first
         * time and then it seems okay after that.
         */
		webDriver.findElement(By.id(loginButtonId)).click();
        Thread.sleep(500);
        List<WebElement> webElements = ExpectedConditions.visibilityOfAllElementsLocatedBy(By.id(loginButtonId)).apply(webDriver);
        if (webElements != null && webElements.size() > 0) {
            webDriver.findElement(By.id(loginButtonId)).click();
        }

		Thread.sleep(2000);
		// Check for Terms and Conditions agreement and click it if necessary
		/*
		final CharSequence title = "Terms & Conditions";
		if (webDriver.getTitle().trim().contains(title)) {
			webDriverWait.until(ExpectedConditions.visibilityOfElementLocated(By.id(acknowledgementCheckId)));
			webDriver.findElement(By.id(acknowledgementCheckId)).click();
			webDriver.findElement(By.id(agreementId)).click();
		}
		*/
	}

    public void forgotPassword() {
        webDriver.findElement(By.id(forgotPasswordId)).click();
    }

	/**
	 * For use on any page that clicks the logout URL.
	 */
	public void logout() {
		logger.info("Selenium testing logout starting...");
		webDriverWait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText(logoutText)));
		webDriver.findElement(By.linkText(logoutText)).click();
		logger.info("Selenium testing logout complete...");
	}

	/**
	 * For use on any page, whether the logout link exists or not.  This is useful for Selenium based tests that want
	 * to reset conditions like logins before completing execution.
	 */
	public void logoutWithOutLink() {
		logger.info("Selenium testing logout starting...");
		webDriver.get(baseUrl + "/user/logout");
		logger.info("Selenium testing logout complete...");
	}
}
