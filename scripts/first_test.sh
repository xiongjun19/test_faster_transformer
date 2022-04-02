set -x

# Run encoder on pytorch
# 1 Run FasterTransformer encoder under FP32 on PyTorch
cd /workspace/FasterTransformer/build
./bin/encoder_gemm 32 32 12 64 0 0
python pytorch/encoder_sample.py 32 12 32 12 64 --time

# 2 Run FasterTransformer encoder under FP16 on PyTorch
./bin/encoder_gemm 32 32 12 64 1 0
python pytorch/encoder_sample.py 32 12 32 12 64 --fp16 --time

# 3 Run FasterTransformer encoder under INT8 on PyTorch
#For int8_mode == 1
./bin/encoder_gemm 32 32 12 64 1 1
python pytorch/encoder_sample.py 32 12 32 12 64 --int8_mode 1 --time

#For int8_mode == 2
./bin/encoder_gemm 32 32 12 64 1 2
python pytorch/encoder_sample.py 32 12 32 12 64 --int8_mode 2 --time


# Execute the decoder/decoding demos
# 1 Run FasterTransformer decoder under FP32 on PyTorch
./bin/decoding_gemm 8 4 8 64 31538 32 512 0
python pytorch/decoder_sample.py 8 6 32 8 64 --time

# 2 Run FasterTransformer decoder under FP16 on PyTorch
./bin/decoding_gemm 8 4 8 64 31538 32 512 1
python pytorch/decoder_sample.py 8 6 32 8 64 --fp16 --time

# Run FasterTransformer decoding under FP32

# Execute the decoder/decoding demos
# 1 Run FasterTransformer decoder under FP32 on PyTorch
./bin/decoding_gemm 8 4 8 64 31538 32 512 0
python pytorch/decoder_sample.py 8 6 32 8 64 --time

# 2 Run FasterTransformer decoder under FP16 on PyTorch
./bin/decoding_gemm 8 4 8 64 31538 32 512 1
python pytorch/decoder_sample.py 8 6 32 8 64 --fp16 --time

# Run FasterTransformer decoding under FP32 on PyTorch

# Execute the decoder/decoding demos
# 1 Run FasterTransformer decoder under FP32 on PyTorch
./bin/decoding_gemm 8 4 8 64 31538 32 512 0
python pytorch/decoder_sample.py 8 6 32 8 64 --time

# 2 Run FasterTransformer decoder under FP16 on PyTorch
./bin/decoding_gemm 8 4 8 64 31538 32 512 1
python pytorch/decoder_sample.py 8 6 32 8 64 --fp16 --time

# 3 Run FasterTransformer decoding under FP32 on PyTorch
./bin/decoding_gemm 8 4 8 64 31538 32 512 0
python pytorch/decoding_sample.py 8 6 32 8 64 4 31538 --time

# 4. Run FasterTransformer decoding under FP16 on PyTorch
./bin/decoding_gemm 8 4 8 64 31538 32 512 1
python pytorch/decoding_sample.py 8 6 32 8 64 4 31538 --fp16 --time
