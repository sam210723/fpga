import argparse
from bitstring import BitArray

argparser = argparse.ArgumentParser(description="Converts 24-bit PPM image to 8-bit RRRGGGBB pixels in COE format")
argparser.add_argument("INPUT", help="Input file path")
argparser.add_argument("OUTPUT", help="Output file path")
args = argparser.parse_args()

# Open input PPM file
print(f"{args.INPUT}:")
fin = open(args.INPUT, "rb")
data = bytearray(fin.read()) # Skip PPM comment
fin.close()

# Read PPM header
ppm_types = { "P3": "Plain PPM (P3)", "P6": "Raw PPM (P6)" }
magic = data[0:2].decode('utf-8')
print(f"  Type:      {ppm_types[magic]}")
data = data[3:]

# Get PPM comment
if data[0:1].decode('utf-8') == "#":
    end = data.find(b'\x0A')
    comment = data[2 : end].decode('utf-8')
    print(f"  Comment:  \"{comment}\"")
data = data[end + 1:]

# Get image size
end = data.find(b'\x0A')
size = data[:end].decode('utf-8').split(' ')
print(f"  Width:     {size[0]} px\n  Height:    {size[1]} px")
w = size[0]
h = size[1]
data = data[end + 1:]

# Get image depth
end = data.find(b'\x0A')
depth = data[:end].decode('utf-8')
print(f"  Depth:     {depth}")
data = data[end + 1:]
print()

# Generate pixel bytes
pix = b''
for y in range(int(h)):
    for x in range(int(w)):
        offset = x * 3 + (y * int(h) * 3)
        pixel = data[offset : offset + 3]
        r = round(pixel[0] / 37)
        g = round(pixel[1] / 37)
        b = round(pixel[2] / 86)
        
        bit = BitArray()
        bit += bin(r)
        bit += bin(g)
        bit += bin(b)
        pix += bit.tobytes()

# Format bytes as COE
fstr = "memory_initialization_radix=16;\nmemory_initialization_vector=\n"
for b in pix:
    fstr += f"{b:0{2}x},\n"

# Remove last comma and new line
fstr = fstr[:-2]

# Print ROM info
print("Width: 8 bits")
print(f"Depth: {len(data)} bytes")

# Write COE to disk
fout = open(args.OUTPUT, "wb")
fout.write(fstr.encode("utf-8"))
fout.close()
