import unittest

import HtmlTestRunner

from spider import Spider


class TestSpider(unittest.TestCase):
    def setUp(self):
        self.spider = Spider()

    def test_get_title(self):
        self.assertEqual(self.spider.get_title(), "JS Button")

    def test_image_default(self):
        # default on
        self.assertIn("images/pic_bulbon.png", self.spider.get_img_src())

    def test_image_turn(self):
        # turn off
        self.spider.click_button()
        self.assertIn("images/pic_bulboff.png", self.spider.get_img_src())
        # turn on
        self.spider.click_button()
        self.assertIn("images/pic_bulbon.png", self.spider.get_img_src())


if __name__ == '__main__':
    # with open("./result/test.txt", "w") as f:
    #     runner = unittest.TextTestRunner(f, verbosity=2)
    #     unittest.main(testRunner=runner)
    unittest.main(testRunner=HtmlTestRunner.HTMLTestRunner(output="./result", combine_reports=True, report_name="all_report"))
