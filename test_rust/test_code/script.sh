#--compile to library
cargo build --release --quiet --lib --target wasm32-unknown-unknown --no-default-features --features "web_app,glow"

#--compile wasm
wasm-bindgen target/wasm32-unknown-unknown/release/test_code.wasm --out-dir web-demo --out-name egui_demo_app --no-modules --no-typescript

#--start basic-http
basic-http-server --addr 192.168.1.10:8888 web-demo
