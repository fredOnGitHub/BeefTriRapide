use std::time::Instant;
use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;
// use std::process; // exit

static mut NB_ECHANGE: u32 = 0;//https://doc.rust-lang.org/book/ch19-01-unsafe-rust.html
/*
Compilation 
rustc main.rs
*/

fn string_en_int32(entree: String) -> Result<i32, String> {
    let n = entree.parse::<i32>().map_err(|err| err.to_string())?;
    Ok(n)
}

fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
// https://doc.rust-lang.org/rust-by-example/std_misc/file/read_lines.html
where
    P: AsRef<Path>,
{
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}

fn main() {
    println!("UTF8 ? 日本 éà");
    let nf = "nombres_aleatoires_50_000.txt";
    // let nf = "test_nombres.txt";
    if let Ok(lines) = read_lines(nf) {
        let mut v: Vec<i32> = Vec::new();
        for line in lines {
            // let a = &line.clone();
            if let Ok(nombre) = string_en_int32(line.unwrap()) {
                // println!("->{}", nombre);
                v.push(nombre);
            } else {
                println!("Erreur avec {}", "");
            }
        }
        let taille = v.len() as u32;
        println!("Taille du tableau créé : {}", taille);
        affiche_vect(&v, 10);
        let now = Instant::now();
        quicksort_dernier_elt(&mut v, 0, (taille - 1) as usize);
        let d = now.elapsed().as_millis();
        println!("Temps mis du tri du tab d'entier en ms : {}", d as f32); // as_millis : u128
        affiche_vect(&v, 10);
        unsafe {
            println!("Nbre d'échange : {}", NB_ECHANGE);
        }
    } else {
        println!("Erreur d'ouverture de fichier {}", nf);
    }
    // process::exit(0);
}
fn affiche_vect(v: &[i32], n: usize) {
    let l;
    if n > v.len() {
        l = v.len();
    } else {
        l = n;
    }
    let slice = &v[0..l];
    print!("Tableau: {:?}\n", slice);
}
//Lomuto partition scheme
fn partition_dernier_elt(v: &mut Vec<i32>, lo: usize, hi: usize) -> usize {
    let pivot = &v[hi].clone(); //https://stackoverflow.com/questions/47618823/cannot-borrow-as-mutable-because-it-is-also-borrowed-as-immutable
    let mut i = lo;
    for j in lo..hi {
        if &v[j] < pivot {
            v.swap(i, j); //https://doc.rust-lang.org/stable/std/mem/fn.swap.html
            unsafe {
                NB_ECHANGE += 1;
            }
            i = i + 1;
        }
    }
    v.swap(i, hi);
    unsafe {
        NB_ECHANGE += 1;
    }
    i /* as i32 */// on retourne i
}
fn quicksort_dernier_elt(v: &mut Vec<i32>, lo: usize, hi: usize) {
    if lo < hi {
        let p = partition_dernier_elt(v, lo, hi);
        // println!("{} {} {}", p, lo, hi);
        if p > 0 // sinon thread 'main' panicked at 'attempt to subtract with overflow', .\main.rs:116:42
        {
            quicksort_dernier_elt(v, lo, p - 1);
        }
        quicksort_dernier_elt(v, p + 1, hi);
    }
}
