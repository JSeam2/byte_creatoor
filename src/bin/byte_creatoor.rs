use std::{error::Error, fs::File, io::Write, path::Path, time::Instant};

use clap::{arg, Parser};
use rand::RngCore;

#[allow(missing_docs)]
#[derive(Parser, Debug, Clone)]
#[command(author, about, long_about = None)]
pub struct ByteCommands {
    #[arg(short = 'p', long)]
    pub path: String,
    #[arg(short = 'n', long)]
    pub num_bytes: usize,
    #[arg(short = 'b', long, default_value = "8000")]
    pub buffer_size: usize,
}

fn main() -> Result<(), Box<dyn Error>> {
    // create a file at the root of the project
    // create N random bytes
    // write the bytes to the file
    // print the path to the file

    let cli = ByteCommands::parse();

    let mut rng = rand::thread_rng();
    let mut bytes = vec![0u8; cli.num_bytes];
    rng.fill_bytes(&mut bytes);

    let path = Path::new(&cli.path);

    let mut file = File::create(&path)?;
    let mut buf_writer = std::io::BufWriter::with_capacity(cli.buffer_size, &mut file);

    let start = Instant::now();
    buf_writer.write_all(&bytes)?;
    let duration = start.elapsed();

    println!(
        "written {} bytes written to: {:?} in {}ms",
        cli.num_bytes,
        path,
        duration.as_millis()
    );
    Ok(())
}