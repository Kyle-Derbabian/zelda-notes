from pyzbar.pyzbar import decode
from PIL import Image
import sys
import os

image_path = sys.argv[1]

img = Image.open(image_path)
data = decode(img)

if data:
    url = data[0].data.decode("utf-8")
    print(url)
else:
    print("NO_QR")

