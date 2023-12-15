use roc_std::{RocResult, RocStr};

#[no_mangle]
pub extern "C" fn roc_fx_genU64() -> u64 {
    123
}

#[no_mangle]
pub extern "C" fn roc_fx_genStr() -> RocStr {
    RocStr::from("abc")
}
