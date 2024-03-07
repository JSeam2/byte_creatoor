# ByteCreatoor

Generates bytes via a rust program

# Quickstart

1. [Install cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html) and install the bytecreatoor binary
```
cargo install --path ./
```

2. Start the seaweed processes in `seaweed_scripts/leader` and `seaweed_scripts/worker`.
Make sure to replace `<replace with master server ip>` with the master server ip that you have hosted.
Ideally, the leader and worker node should be on different machines.

3. Run `./write_loop.sh ./mount/file` and write into the seaweed mounted folder.

# Recorded SeaweedFS Perfomance Results
The leader node and worker node are hosted on the same VLAN and have SSDs setup. [Link to results](https://docs.google.com/spreadsheets/d/1CsI-g4rr4uvJy_cNNqsViEDLh89l-E3P4bhyFsMTZPY/edit?usp=sharing)

