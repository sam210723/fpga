import argparse
from bitstring import BitArray
from PIL import Image

argparser = argparse.ArgumentParser(description="Converts 24-bit BMP image to 8-bit RRRGGGBB pixels in COE format")
argparser.add_argument("INPUT", help="Input file path")
argparser.add_argument("OUTPUT", help="Output file path")
args = argparser.parse_args()

# Create image object from BMP file
print(f"Opening \"{args.INPUT}\"...")
img = Image.open(args.INPUT)
print(f"  Width:  {img.size[0]}px\n  Height: {img.size[1]}px")

# Loop through image pixels
data = b''
for y in range(img.size[1]):
    for x in range(img.size[0]):
        # Get current pixel
        pix = img.getpixel((x, y))

        # Decimate pixel values
        r = int((pix[0] / 255) * 7)
        g = int((pix[1] / 255) * 7)
        b = int((pix[2] / 255) * 3)

        # Pack bits into byte
        bit = BitArray()
        bit += bin(r)
        bit += bin(g)
        bit += bin(b)
        data += bit.tobytes()

# Format bytes as COE
fstr = "memory_initialization_radix=16;\nmemory_initialization_vector=\n"
for b in data:
    fstr += f"{b:0{2}x},\n"

# Remove last comma and new line
fstr = fstr[:-2]

# Print ROM info
print("\nROM Info:")
print("  Width: 8 bits")
print(f"  Depth: {len(data)} bytes")

# Write COE to disk
fout = open(args.OUTPUT, "wb")
fout.write(fstr.encode("utf-8"))
fout.close()
print(f"\nCOE saved to \"{args.OUTPUT}\"")
print(f"  Size: ~{int(len(fstr) / 1024)} KB")
