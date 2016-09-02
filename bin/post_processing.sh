#!/usr/bin/env bash
# post processing data from weight file
# including calculate covariance, mean, std with visualize.py
# rename files generated
# calculate mean of correlation
layers="0 2 5 7 11"
suffix=""
if [ $# -lt 1 ]
then
  echo "You must specify the path of weight file to be used"
  exit
fi
weight_path=$1
if [ $# -ge 2 ]
then
  suffix=$2
fi
if [ $# -ge 3 ]
then
  layers=$3
fi
echo "Going to use " $weight_path
echo $suffix
for i in $layers
do
  ./visualize.py $weight_path -l $i
  ./move_data.sh ${suffix}_$i
  ./get_mean.py ./covariance_${suffix}_$i >> mean_covariance_$suffix
done
