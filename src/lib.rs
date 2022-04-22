#[swift_bridge::bridge]
mod ffi {
    extern "Rust" {
        type RustApp;

        #[swift_bridge(init)]
        fn new() -> RustApp;

        fn user_path(&self, loc: &str) -> String;
    }
}

pub struct RustApp {}

impl RustApp {
    fn new() -> Self {
        RustApp {}
    }

    fn user_path(&self, loc: &str) -> String {
        // Writing data to location
        let path = format!("{}{}", loc, "SLED/")[7..].to_owned();
        println!("Inserting data to: {}", path);
        let tree = sled::open(path).unwrap();

        // // insert and get, similar to std's BTreeMap
        // let _old_value = tree.insert("key", "value").unwrap();

        println!("Saved value: ");
        dbg!(tree.get(&"key").unwrap().unwrap());

        assert_eq!(tree.get(&"key").unwrap(), Some(sled::IVec::from("value")),);
        tree.flush().unwrap();
        "".into()
    }
}
