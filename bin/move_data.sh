#!/usr/bin/env bash
# rename covariance mean std generated from visualize.py 
set -x
if [ $# -lt 1 ]
then
  echo "You must specify the layer"
  exit
fi
layer=$1
mv covariance covariance_$layer
mv mean mean_$layer
mv std std_$layer
