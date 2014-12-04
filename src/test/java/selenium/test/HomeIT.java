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
public class HomeIT {
	private static final Logger logger = LoggerFactory.getLogger(HomeIT.class);

	public static final String headerText = "headerText";
	public static final String leftNavyearId = "leftNavyear";
	public static final String leftNavmakeId = "leftNavmake";
	public static final String leftNavmodelId = "leftNavmodel";
	public static final String promotionsId = "promotions3";
	public static final String headerTitlePageNameClass = "headerTitlePageName";

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
	@Value(value = "#{selenium['login.name1']}")
	String loginName1;
	@Value(value = "#{selenium['login.password1']}")
	String loginPassword1;

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
	public void testHome() throws Exception {
		logger.info("Starting selenium testing on home page...");

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
		final String title = "Selenium Examples";
		Assert.assertEquals(title, webDriver.getTitle().substring(0, title.length()));
		Assert.assertNotNull(webDriver.findElement(By.id(headerText)));

		Thread.sleep(2000);

		// Log out
		loginPage.logout();

		logger.info("Selenium testing on home page complete...");
	}

}
