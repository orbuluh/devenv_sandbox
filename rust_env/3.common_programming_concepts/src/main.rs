fn return_val_from_break_of_infinite_loop() {
    let mut counter = 0;

    let result = loop {
        counter += 1;

        if counter == 10 {
            break counter * 2;
        }
    };

    // result is the value of counter * 2
    println!("result={result}, counter={counter}");
}



fn break_outter_loop() {
// Output will be:
//
// count = 0
// remaining = 10
// remaining = 9
// count = 1
// remaining = 10
// remaining = 9
// count = 2
// remaining = 10
// End count = 2

// e.g. remaining will always be reset back to 10
// when count == 0 or count == 1, inner infinite loop breaks when remaning == 9
// and when count == 2, it breaks the outter loop

    let mut count = 0;
    'counting_up: loop {
        println!("count = {count}");
        let mut remaining = 10;

        loop {
            println!("remaining = {remaining}");
            if remaining == 9 {
                break;
            }
            if count == 2 {
                break 'counting_up;
            }
            remaining -= 1;
        }

        count += 1;
    }
    println!("End count = {count}");
}

fn main() {
    return_val_from_break_of_infinite_loop();
    println!("\n------------------\n");
    break_outter_loop();
}