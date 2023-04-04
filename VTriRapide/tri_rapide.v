import os
import time

fn main() {
    
	println('UTF8 ? 日本 éà')
	// for i in 0 .. 1 {//0
	//     println(i)
    // }
    // exit(0)
    // println('------------------------------------------------')
    // filename := 'test_1_a_9.txt'
    filename := 'nombres_aleatoires_50_000.txt'
    data := os.read_file(filename) or {
        panic('error reading file $filename')
        // exit(0)
        return
    }
    // println(data)
    if data.contains('\r\n') {
        println("contient \\r\\n")
    }
    new_data := data.replace('\r\n','\n')
    // println(new_data)
    mut nl := 0
    for g in new_data.split('\n') {
        if g != ""{
            // println('<$g>')
            nl++
        }
    }
    // Setting the capacity improves performance of pushing elements to the array as reallocations can be avoided:
    // https://github.com/vlang/v/blob/master/doc/docs.md#arrays
    mut t := []int{len: nl, cap: nl}
    mut i := 0
    println('$t.len éléments')
    for g in new_data.split('\n') {
        if g != ""{
            nl++
            // println('<$g>')
            a:=g.int()//https://github.com/vlang/v/issues/273
            // println('a=$a')
            // attention il retourne 0 si "ddd"
            t[i]=a
            i++
        }
    }

    // println('$t.len éléments')
    // println(t#[-1..])
    println(t#[..20])  
    mut nb_swap:=0
    // incr(mut nb_swap)
    sw := time.new_stopwatch()
    quick_sort(mut t, 0, t.len-1, mut nb_swap)
    // // time.sleep(2000 * time.millisecond)
    println('Temps mis du tri du tab d\'entier en ms : ${sw.elapsed().milliseconds()}')
    println(t#[..20])
    println('Nombre d\'échanges : $nb_swap')
}

// https://github.com/vlang/v/blob/master/doc/docs.md#primitive-types
// https://github.com/vlang/v/blob/master/doc/docs.md#global-variables
// By default V does not allow global variables. However, i
// mut nb_swap := 0
fn partition(mut arr []int, start int, end int, mut nb_swap &int) int
{
    pivot_value := arr[end]
    mut pivot_index := start
    // for e in arr#[start..end]
    for i in start..end// end ne sera pas pris en compte
    {
        if arr[i] < pivot_value
        {
            arr[i], arr[pivot_index] = arr[pivot_index], arr[i]
            nb_swap += 1
            pivot_index += 1
        }
    }
    arr[end], arr[pivot_index] = arr[pivot_index], arr[end]
    nb_swap += 1
    return pivot_index
}

fn quick_sort(mut arr []int, start int, end int, mut nb_swap &int)
{
    if start >= end{
        return
    }
    pivot_index := partition(mut arr, start, end, mut nb_swap)
    quick_sort(mut arr, start, pivot_index - 1, mut nb_swap)
    quick_sort(mut arr, pivot_index + 1, end, mut nb_swap)
}

// warning: automatic referencing/dereferencing is deprecated and will be removed soon (got: 0 references, expected: 1 references)

// https://github.com/vlang/v/blob/master/doc/docs.md#references
fn incr(mut a &int){//c'est le seul moyen pour incrémenter une variable
    a+=1
    return
}

// fn split(str_ string, mut substr_list []int, dl string){
// // https://www.geeksforgeeks.org/split-string-substrings-using-delimiter/
//     mut word := ""
//     str := str_ + dl//pour enreg le dernier
//     // println('str = '+conv_r_n(str))
//     for c in str{
//         if c.ascii_str() == '\r'{
//         }
//         else if c.ascii_str() == '\n'{
//             if word.len != 0{
//                 i := word.int()
//                 substr_list << i
//                 word=""
//             }
//         }
//         else{
//             word += c.ascii_str()
//         }
//     }
// }
// fn conv_r_n(str string)string{
//     mut r:=''
//     for c in str{
//         if c.ascii_str() == '\r'{
//             r+='\\r'
//         }
//         else if c.ascii_str() == '\n'{
//             r+='\\n'
//         }
//         else{
//             r+=c.ascii_str()
//         }
//     }
//     // println('r = <$r>')
//     return r
// }

// 50000 éléments
// [9341, 42560, 22277, 2059, 18164, 40285, 26002, 26780, 44896, 36077, 14841, 31205, 11744, 37077, 21531, 44472, 20267, 11855, 27220, 28208]
// Durée du tri: 0.0249102s
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 10, 11, 13, 14, 14, 17, 18, 19, 20]

