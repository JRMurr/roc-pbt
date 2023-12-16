use roc_std::RocStr;

#[no_mangle]
pub extern "C" fn roc_fx_genU64() -> u64 {
    123
}

#[no_mangle]
pub extern "C" fn roc_fx_genStr(out: *mut RocStr) {
    unsafe {
        out.write(RocStr::from("abc"));
    }
}

#[no_mangle]
pub extern "C" fn roc_fx_stdoutLine(line: &RocStr) {
    dbg!(line);
    let string = line.as_str();
    println!("{}", string);
}
