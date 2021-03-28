from PIL import Image
from PIL import ImageFilter
from PIL import ImageEnhance
from PIL import ImageDraw , ImageFont

i = 0
fnt = ImageFont.truetype(r"/usr/share/fonts/truetype/liberation2/LiberationMono-Bold.ttf", 420)
for i in range(110) :
	im = Image.open(r"./pic/linuxmint.jpg")
	draw = ImageDraw.Draw(im)
	draw.text((300, 120), "%3d" %i, fill="white", font=fnt)
	fname = r"./pic/" + str(i) + ".jpg"
	im.save(fname)
