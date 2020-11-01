import argparse
import binascii

argparser = argparse.ArgumentParser(description="Converts binary file to COE format")
argparser.add_argument("INPUT", help="Input file path")
argparser.add_argument("OUTPUT", help="Output file path")
args = argparser.parse_args()

fin = open(args.INPUT, "rb")
data = bytearray(fin.read())
fin.close()

fstr = "memory_initialization_radix=16;\nmemory_initialization_vector=\n"
for b in data:
    fstr += f"{b:0{2}x},\n"

fstr = fstr[:-2] # Remove last comma and new line

print("Width: 8 bits")
print(f"Depth: {len(data)} bytes")
fout = open(args.OUTPUT, "wb")
fout.write(fstr.encode("utf-8"))
fout.close()
