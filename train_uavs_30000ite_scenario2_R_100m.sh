#!/bin/bash

mkdir fig/100m_30000iter_scenario2


###### 260m

cp uav_location_scenario2_100m.txt uav_location.txt

echo "Copying the net deployment"
echo "100m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r100_s2.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "100m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "100m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "100m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "100m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "100m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"

cd fig
./temscript_30000.sh 100m_30000iter_scenario2
cd ..

