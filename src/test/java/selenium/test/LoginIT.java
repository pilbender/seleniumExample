package selenium.test;

import selenium.page.LoginPage;

import java.util.Properties;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author Richard Scott Smith <scott.smith@isostech.com>
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/selenium/selenium-context.xml"})
public class LoginIT {
	private static final Logger logger = LoggerFactory.getLogger(LoginIT.class);

	public static final String headerText = "headerText";

	@Resource(name = "selenium")
	Properties selenium = new Properties();
	@Resource(name = "webDriver")
	WebDriver webDriver;
	@Resource(name = "webDriverWait")
	WebDriverWait webDriverWait;
	@Resource(name = "loginPage")
	LoginPage loginPage;

	@Value(value = "#{selenium['base.url']}")
	String baseUrl;
	@Value(value = "#{selenium['login.name0']}")
	String loginName0;
	@Value(value = "#{selenium['login.password0']}")
	String loginPassword0;

	@BeforeClass
	public static void setUpClass() throws Exception {
	}

	@AfterClass
	public static void tearDownClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testLogin() throws Exception {
		logger.info("Starting selenium testing on login page...");

		// Maximize the browser
		webDriver.manage().window().maximize();
		// Go to our application
		webDriver.get(baseUrl);
		// Logout just in case the previous test failed
		loginPage.logoutWithOutLink();
		// Fill out and submit login credentials
		loginPage.login(loginName0, loginPassword0, false);

		// Wait for certain elements to load in the page
		webDriverWait.until(ExpectedConditions.visibilityOfElementLocated(By.id(headerText)));

		// Check basic stuff
		// Doesn't change fast enough.  Commenting out for now.
		final String title = "Selenium Example";
		Assert.assertEquals(title, webDriver.getTitle().substring(0, title.length()));
		Assert.assertNotNull(webDriver.findElement(By.id(headerText)));

		Thread.sleep(2000);

		// Log out
		loginPage.logout();

		logger.info("Selenium testing on login page complete...");
	}
}
