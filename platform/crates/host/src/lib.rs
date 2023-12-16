// use std::{alloc::Layout, mem::MaybeUninit};

use roc_app::mainForHost;

mod generators;
mod required_externs;

// use std::ffi::CStr;
// use std::io::Write;
// use std::os::raw::c_char;

#[no_mangle]
pub extern "C" fn rust_main() -> i32 {
    println!("ENTERTING ROC");
    let res = mainForHost();
    println!("LEAVING ROC\nRES:({res:?})");
    0
}

// pub unsafe fn call_the_closure(closure_data_ptr: *const u8) -> u8 {
//     let size = 5000;
//     let layout = Layout::array::<u8>(size).unwrap();
//     let buffer = std::alloc::alloc(layout) as *mut u8;

//     let roc_func = RocFunction_72 {}

//     RocFunction_72::force_thunk(
//         // This flags pointer will never get dereferenced
//         MaybeUninit::uninit().as_ptr(),
//         closure_data_ptr as *const u8,
//         buffer as *mut u8,
//     );

//     std::alloc::dealloc(buffer, layout);

//     // TODO return the u8 exit code returned by the Fx closure
//     0
// }
