import argparse

argparser = argparse.ArgumentParser(description="Invert bits in binary file")
argparser.add_argument("INPUT", help="Input file path")
argparser.add_argument("OUTPUT", help="Output file path")
args = argparser.parse_args()

fin = open(args.INPUT, "rb")
data = bytearray(fin.read())
fin.close()
inv = bytearray(b'')

for b in data:
    inv.extend(bytes([0xFF - b]))

fout = open(args.OUTPUT, "wb")
fout.write(bytes(inv))
fout.close()
