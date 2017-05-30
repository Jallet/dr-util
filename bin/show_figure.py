#!/usr/bin/env python
import sys
import matplotlib.pyplot as plt
import numpy as np
import argparse
def argparser():
    parser = argparse.ArgumentParser()
    parser.add_argument("path")
    parser.add_argument("-t", "--title",
            help = "title of figure", 
            action = "store", default = "")
    return parser

parser = argparser()
args = parser.parse_args()
path = args.path
title = args.title

data = np.loadtxt(path)
print("shape of data", data.shape)
fig = plt.figure()
if data.ndim == 2:
    cmap = plt.cm.gray_r
    # norm = plt.colors.Normalize(vmin=0)
    plt.imshow(data, cmap = cmap)
else:
    if "" == title:
        title = path
    plt.plot(data)
    plt.legend()
    plt.grid(True)
    plt.title(title)

plt.show()
