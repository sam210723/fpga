import argparse
import binascii

argparser = argparse.ArgumentParser(description="Converts binary file to HEX format")
argparser.add_argument("INPUT", help="Input file path")
argparser.add_argument("OUTPUT", help="Output file path")
args = argparser.parse_args()

fin = open(args.INPUT, "rb")
data = bytearray(fin.read())
fin.close()

hex_str = binascii.hexlify(data)

fout = open(args.OUTPUT, "wb")
fout.write(hex_str)
fout.close()
