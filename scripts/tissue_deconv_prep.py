#!/usr/bin/env python

import sys
import argparse


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--biomarkers", action='store', metavar="</path/to/file>", required=True, help="Path to biomarkers file.")
    #parser.add_argument("--input", action='store', default='', metavar="</path/to/file>", help="Path to input file.")
    args = parser.parse_args()
 
    data = [] # index, chromosome, start, end, ...
    with open(args.biomarkers, 'r') as bio:
        for e, line in enumerate(bio):
            if e == 0 : continue
            [idx, chromosome, start, end] = line.split()[:4]
            data.append([int(idx), chromosome, int(start), int(end)])
    

    for line in sys.stdin:
        [chrom, site, val] = line.split()[:4]
        for d in data:
            if chrom == d[1] and int(d[2]) < int(site) < int(d[3]):
                print d[0], val
                break

if __name__ == '__main__':
    main()