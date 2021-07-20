#!/bin/bash

cp uav_location_50m.txt uav_location.txt

echo "Copying the net deployment"
cp config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_r50.json config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"

python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"

cd fig
./temscript.sh 50m
cd ..

###### HISTORY:
# First results with "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
# Second results with "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"

cp uav_location_100m.txt uav_location.txt

echo "Copying the net deployment"
cp config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_r100.json config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10.json


echo "Train Slicing - Random Deployment"

python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"

cd fig
./temscript.sh 100m
cd ..

###### HISTORY:
# First results with "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
# Second results with "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"

cp uav_location_200m.txt uav_location.txt
echo "Copying the net deployment"
cp config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_r200.json config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10.json


echo "Train Slicing - Random Deployment"

python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"

cd fig
./temscript.sh 200m
cd ..

###### HISTORY:
# First results with "train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10"
# Second results with "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"

cp uav_location_300m.txt uav_location.txt
echo "Copying the net deployment"
cp config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_r300.json config/deployment/train_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10.json


echo "Train Slicing - Random Deployment"

python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode4-2500_travelIND_fd10"

cd fig
./temscript.sh 300m