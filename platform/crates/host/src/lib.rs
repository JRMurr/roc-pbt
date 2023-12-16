use std::{alloc::Layout, mem::MaybeUninit};

mod generators;
mod required_externs;

#[no_mangle]
pub extern "C" fn rust_main() -> i32 {
    let size = unsafe { roc_main_size() } as usize;
    let layout = Layout::array::<u8>(size).unwrap();

    unsafe {
        let buffer = std::alloc::alloc(layout);

        roc_main(buffer);

        call_the_closure(buffer);

        std::alloc::dealloc(buffer, layout);
    }

    0
}

extern "C" {
    #[link_name = "roc__mainForHost_1_exposed_generic"]
    pub fn roc_main(output: *mut u8);

    #[link_name = "roc__mainForHost_1_exposed_size"]
    pub fn roc_main_size() -> i64;

    #[link_name = "roc__mainForHost_0_caller"]
    fn call_Fx(flags: *const u8, closure_data: *const u8, output: *mut u8);

    #[allow(dead_code)]
    #[link_name = "roc__mainForHost_0_size"]
    fn size_Fx() -> i64;

    #[link_name = "roc__mainForHost_0_result_size"]
    fn size_Fx_result() -> i64;
}

/// # Safety
///
/// call_the_closure
pub unsafe fn call_the_closure(closure_data_ptr: *const u8) -> u8 {
    let size = size_Fx_result() as usize;
    let layout = Layout::array::<u8>(size).unwrap();
    let buffer = std::alloc::alloc(layout);

    call_Fx(
        // This flags pointer will never get dereferenced
        MaybeUninit::uninit().as_ptr(),
        closure_data_ptr,
        buffer,
    );

    std::alloc::dealloc(buffer, layout);

    // TODO return the u8 exit code returned by the Fx closure
    0
}
