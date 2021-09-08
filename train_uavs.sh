#!/bin/bash

cp uav_location_50m.txt uav_location.txt

echo "Copying the net deployment"
echo "50m"
cp config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_r50.json config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "50m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "50m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "50m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "50m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "50m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"

cd fig
./temscript.sh 50m
cd ..

###### HISTORY:
# First results with "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
# Second results with "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"

cp uav_location_100m.txt uav_location.txt

echo "Copying the net deployment"
echo "100m"
cp config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_r100.json config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10.json


echo "Train Slicing - Random Deployment"
echo "100m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "100m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "100m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "100m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "100m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"

cd fig
./temscript.sh 100m
cd ..

###### HISTORY:
# First results with "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
# Second results with "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"

cp uav_location_200m.txt uav_location.txt
echo "Copying the net deployment"
echo "200m"
cp config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_r200.json config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10.json


echo "Train Slicing - Random Deployment"
echo "200m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "200m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "200m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "200m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "200m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"

cd fig
./temscript.sh 200m
cd ..

###### HISTORY:
# First results with "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
# Second results with "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"

cp uav_location_300m.txt uav_location.txt
echo "Copying the net deployment"
echo "300m"
cp config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_r300.json config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10.json


echo "Train Slicing - Random Deployment"
echo "300m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "300m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "300m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "300m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "300m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"

cd fig
./temscript.sh 300m