# bash script that writes a for loop over N bytes to a file
# Usage: ./write_loop.sh <filename>

# file sizes
sizes=(1024 1048576 1073741824 21474836480 107374182400)
# block sizes
blocks=(8000 16000 640000 1000000 1000000000)

# Nested loop to iterate over sizes and blocks
for i in "${sizes[@]}"; do
    for b in "${blocks[@]}"; do
        # Call byte_creatoor with current size and block
        byte_creatoor -n $i -p $1 -b $b
    done
done