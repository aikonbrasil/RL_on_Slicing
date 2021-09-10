#!/bin/bash

mkdir fig/50m_30000iter
mkdir fig/75m_30000iter
mkdir fig/100m_30000iter
mkdir fig/120m_30000iter
mkdir fig/140m_30000iter
mkdir fig/160m_30000iter
mkdir fig/200m_30000iter
mkdir fig/220m_30000iter
mkdir fig/240m_30000iter
mkdir fig/260m_30000iter
mkdir fig/280m_30000iter
mkdir fig/300m_30000iter

###### 220m

cp uav_location_220m.txt uav_location.txt

echo "Copying the net deployment"
echo "220m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r220.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "220m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "220m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "220m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "220m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "220m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"

cd fig
./temscript_30000.sh 220m_30000iter
cd ..

###### 240m

cp uav_location_240m.txt uav_location.txt

echo "Copying the net deployment"
echo "240m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r240.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "240m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "240m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "240m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "240m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "240m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"

cd fig
./temscript_30000.sh 240m_30000iter
cd ..

###### 260m

cp uav_location_260m.txt uav_location.txt

echo "Copying the net deployment"
echo "140m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r260.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "260m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "260m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "260m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "260m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "260m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"

cd fig
./temscript_30000.sh 260m_30000iter
cd ..


###### 280m

cp uav_location_280m.txt uav_location.txt

echo "Copying the net deployment"
echo "280m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r280.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "280m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "280m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "280m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "280m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "280m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"

cd fig
./temscript_30000.sh 280m_30000iter
cd ..

###### 300m

cp uav_location_300m.txt uav_location.txt

echo "Copying the net deployment"
echo "300m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r300.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "300m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "300m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "300m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "300m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "300m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"

cd fig
./temscript_30000.sh 300m_30000iter
cd ..