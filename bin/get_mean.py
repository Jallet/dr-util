#!/usr/bin/env python
# get mean of covariance from a covariance file
import numpy as np
import argparse

def argparser():
    parser = argparse.ArgumentParser()
    parser.add_argument("array_path", help = "path of matrix file")
    return parser

def main():
    parser = argparser()
    args = parser.parse_args()
    array_path = args.array_path
    array = np.loadtxt(array_path)
    mean_value = np.mean(array) - 1. / (array.shape[0] * array.shape[1])
    print("mean_value", mean_value)

if "__main__" == __name__:
    main()
