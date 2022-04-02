set -x 

cd /workspace/FasterTransformer/build

# 1 Prepare model and data
bash pytorch/scripts/download_translation_model.sh

# 2 Run under FP32
./bin/decoding_gemm 128 4 8 64 31538 100 512 0
python pytorch/run_translation.py --batch_size 128 --beam_size 4 --model_type decoding_ext --data_type fp32

# 3 Run under FP16
./bin/decoding_gemm 128 4 8 64 31538 100 512 1
python pytorch/run_translation.py --batch_size 128 --beam_size 4 --model_type decoding_ext --data_type fp16

