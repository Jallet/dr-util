#!/usr/bin/env bash
# post processing data from weight file
# including calculate covariance, mean, std with visualize.py
# rename files generated
# calculate mean of correlation
suffix=""
if [ $# -lt 2 ]
then
  echo "You must specify the model(cnn or mlp) and path of weight file to be used"
  exit
fi
mode=$1
echo $mode
weight_path=$2
echo $weight_path
if [ "cnn"x = "$mode"x ]
then
  layers="0 2 5 7 11"
elif [ "mlp"x = "$mode"x ]
then
  layers="0 2 4 6 8 11"
else
  echo "Illegal mode"
  exit
fi

if [ $# -ge 3 ]
then
  suffix=$3
fi
if [ $# -ge 4 ]
then
  layers=$4
fi
echo "Going to use " $weight_path
echo $suffix
for i in $layers
do
  if [ "cnn"x = "$mode"x ]
  then
    ~/code/util/bin/visualize.py $weight_path -l $i
  else
    ~/code/util/bin/visualize_mlp.py $weight_path -l $i
  fi
  ~/code/util/bin//move_data.sh ${suffix}_$i
  ~/code/util/bin//get_mean.py ./covariance_${suffix}_$i >> mean_covariance_$suffix
done
