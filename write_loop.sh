# bash script that writes a for loop over N bytes to a file
# Usage: ./write_loop.sh <filename>

# 8kb 16kb 640kb 1mb 1GB
for b in 8000 16000 640000 1000000 1000000000; do
    cargo run --release  --bin byte_creatoor -- -n 21474836480 -p $1 -b $b
done
# we try 1kb, 1mb, 1gb, 20gb 100gb,
for i in 1024 1048576 1073741824 21474836480 107374182400; do
    cargo run --release  --bin byte_creatoor -- -n $i -p $1 -b 8000
done
