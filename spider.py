from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

class Spider:
    def __init__(self):
        self.driver = webdriver.Remote(
            command_executor="http://selenium-chrome:4444/wd/hub",
            desired_capabilities=DesiredCapabilities.CHROME)
        self.driver.get("http://html/3_jsbutton.html")

    def get_title(self):
        return self.driver.title

    def click_button(self):
        self.driver.find_element_by_id("switch_button").click()

    def get_img_src(self):
        return self.driver.find_element_by_id("myImage").get_attribute("src")

    def __del__(self):
        self.driver.close()
