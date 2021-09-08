#!/bin/bash

mkdir 50m_30000iter
mkdir 75m_30000iter
mkdir 100m_30000iter
mkdir 120m_30000iter
mkdir 140m_30000iter
mkdir 160m_30000iter
mkdir 200m_30000iter
mkdir 220m_30000iter
mkdir 240m_30000iter
mkdir 260m_30000iter
mkdir 280m_30000iter
mkdir 300m_30000iter

## 50m
cp uav_location_50m.txt uav_location.txt

echo "Copying the net deployment"
echo "50m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r50.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "50m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "50m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "50m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "50m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "50m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"

cd fig
./temscript_30000.sh 50m_30000iter
cd ..

###### 75m


cp uav_location_75m.txt uav_location.txt

echo "Copying the net deployment"
echo "75m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r75.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "75m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "75m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "75m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "75m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "75m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"

cd fig
./temscript_30000.sh 75m_30000iter
cd ..

###### 100

cp uav_location_100m.txt uav_location.txt

echo "Copying the net deployment"
echo "100m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r100.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

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
./temscript_30000.sh 100m_30000iter
cd ..

###### 120

cp uav_location_120m.txt uav_location.txt

echo "Copying the net deployment"
echo "120m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r120.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "120m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "120m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "120m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "120m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "120m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"

cd fig
./temscript_30000.sh 120m_30000iter
cd ..

###### 140m

cp uav_location_140m.txt uav_location.txt

echo "Copying the net deployment"
echo "140m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r140.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "140m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "140m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "140m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "140m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "140m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"

cd fig
./temscript_30000.sh 140m_30000iter
cd ..


###### 160m

cp uav_location_160m.txt uav_location.txt

echo "Copying the net deployment"
echo "160m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r160.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "160m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "160m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "160m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "160m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "160m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"

cd fig
./temscript_30000.sh 160m_30000iter
cd ..

###### 200m

cp uav_location_200m.txt uav_location.txt

echo "Copying the net deployment"
echo "200m"
cp config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_r200.json config/deployment/train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10.json

echo "Train Slicing - Random Deployment"
echo "200m"
python ./random_deployment.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
echo "200m"
python ./trainProposed.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
echo "200m"
python ./trainJoint.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
echo "200m"
python ./get_benchmarks.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
echo "200m"
python ./train_results.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10"

cd fig
./temscript_30000.sh 200m_30000iter
cd ..

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