use assert_cmd::Command; // need to add dev-dependencies in Cargo.toml

#[test]
fn works() {
  let mut cmd = Command::cargo_bin("hello_world").unwrap();
  //  If fails, then unwrap will cause a panic and the test will fail
  cmd.assert().success().stdout("Hello, world!\n");
}

#[test]
fn true_ok() {
 let mut cmd = Command::cargo_bin("true").unwrap();
 cmd.assert().success();
}
