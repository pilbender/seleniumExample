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
import org.openqa.selenium.JavascriptExecutor;
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
public class WebServiceIT {
	private static final Logger logger = LoggerFactory.getLogger(WebServiceIT.class);

	public static final String usernameId = "loginName";

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
	public void testWebServiceResponse() throws Exception {
		logger.info("Starting web service response testing...");

		// Maximize the browser
		webDriver.manage().window().maximize();
		// Go to our application
		webDriver.get(baseUrl);
		// Logout just in case the previous test failed
		loginPage.logoutWithOutLink();
		// Fill out and submit login credentials
		loginPage.login(loginName0, loginPassword0, false);

		StringBuilder urlTest1 = new StringBuilder(baseUrl);
		urlTest1.append("/ajax");
		webDriver.get(urlTest1.toString());

        // Wait for the page to load
		// This will not work until it is set visible!!
		//webDriverWait.until(ExpectedConditions.visibilityOfElementLocated(By.id("ajaxGet")));
        JavascriptExecutor js = (JavascriptExecutor) webDriver;
        js.executeScript("document.getElementById('ajaxGet').setAttribute('style', 'display: block');");
        webDriverWait.until(ExpectedConditions.textToBePresentInElementLocated(By.id("ajaxGet"), "true"));
        String response = webDriver.findElement(By.id("ajaxGet")).getText();
        // Assert true in the response
        Assert.assertEquals("true", response);

        Thread.sleep(2000);

		// Log out
		loginPage.logoutWithOutLink();

		logger.info("testing web service complete...");
	}
}
