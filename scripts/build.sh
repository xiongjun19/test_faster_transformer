docker image build -t test_ftf:0.1 . -f Dockerfile
docker run --gpus all -p 8891:8891 --name cont_ftf --ipc=host 
	-it -v /nfs/homes/jxiong/code/test_faster_transformer:/workspace/ftf test_ftf:0.1


