

```bash
sudo snap install rustup --classic
cargo new hello_world

# if above failed for error: no default toolchain configured
# run these 2s...
rustup install stable
rustup default stable

cargo run
# or to not print status messages about compiling
cargo run --quiet
# or executable at
./target/debug/hello_world
```