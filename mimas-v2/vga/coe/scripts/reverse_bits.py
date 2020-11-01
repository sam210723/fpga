import argparse

argparser = argparse.ArgumentParser(description="Reverses bits in binary file")
argparser.add_argument("INPUT", help="Input file path")
argparser.add_argument("OUTPUT", help="Output file path")
args = argparser.parse_args()

fin = open(args.INPUT, "rb")
data = bytearray(fin.read())
fin.close()
rev = bytearray(b'')

for b in data:
    i = int('{:08b}'.format(b)[::-1], 2)
    rev.extend(bytes([i]))

fout = open(args.OUTPUT, "wb")
fout.write(bytes(rev))
fout.close()
