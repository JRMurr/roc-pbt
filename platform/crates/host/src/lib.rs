use roc_app::mainForHost;

mod required_externs;

// use std::ffi::CStr;
// use std::io::Write;
// use std::os::raw::c_char;

#[no_mangle]
pub extern "C" fn rust_main() -> i32 {
    let res = mainForHost();
    println!("I did rust stuff: ${res}");
    0
}
