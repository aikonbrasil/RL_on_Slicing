#!/bin/bash

echo "Train Slicing - Random Deployment"

python ./random_deployment.py --json-file "train_K20_N100_M4_shadow10_episode4-5000_travelIND_fd10" --num-sim 0 &
wait

echo "Train Slicing - Proposed Algorithm "
python ./trainProposed.py --json-file "train_K20_N100_M4_shadow10_episode4-5000_travelIND_fd10" --num-sim 0 &
wait


echo "Train - Joint Algorithm"
python ./trainJoint.py --json-file "train_K20_N100_M4_shadow10_episode4-5000_travelIND_fd10" --num-sim 0 &
wait

echo "Train - Get FP Benchmarks"
python ./get_benchmarks.py --json-file "train_K20_N100_M4_shadow10_episode4-5000_travelIND_fd10" --num-sim 0 &
wait


echo "Train Results, each interactive Ctrl +Z to pass to the next result"
python ./train_results.py --json-file "train_K20_N100_M4_shadow10_episode4-2500_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M1_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_interference.py --json-file "train_K20_N100_M4_shadow10_episode4-2500_travelIND_fd10"
#python3 -i ./train_results.py --json-file "train_K1_N20_M2_shadow10_episode4-5000_travelIND_fd10"
python ./train_results_individualslices.py --json-file "train_K20_N100_M4_shadow10_episode4-2500_travelIND_fd10"
