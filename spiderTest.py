import unittest
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
    unittest.main()
