// Charge un fichier texte
// Daniel Shiffman
// https://www.youtube.com/watch?v=0Mq2CxspF5s
// 1.4: Getting Text from User: Loading a Text File - Programming with Text

// https://p5js.org/reference/#/p5/loadStrings

// voir ce site https://editor.p5js.org/detroit/sketches/MeIIOYCbH

let a;
let t = [];
let nb_swap = 0;

function affiche_les_n(n) {
  s = "";
  for (i = 0; i < n && i < t.length; i++) {
    s += t[i] + "  ";
  }
  print(s);
}

function preload() {
  a = loadStrings("nombres_aleatoires_50_000.txt");
}

function quickSort(arr, start, end) {
  if (start < end) {
    let index = partition(arr, start, end);
    quickSort(arr, start, index - 1);
    quickSort(arr, index + 1, end);
  }
}

function partition(arr, start, end) {
  // QuicksortDernierElt
  let pivotValue = arr[end];
  let pivotIndex = start;
  for (let i = start; i < end; i++) {
    if (arr[i] < pivotValue) {
      swap(arr, i, pivotIndex);
      pivotIndex++;
    }
  }
  swap(arr, pivotIndex, end);
  return pivotIndex;
}

function setup() {
  noCanvas();
  // createP(join(result,"<br>"));
  // print("a.len " + a.length);
  // print(typeof a[0]);

  a.forEach((e) => {
    t.push(parseInt(e));
  });
  print("t.len " + t.length);
  // print(typeof t[0]);
  affiche_les_n(20);
  ms1 = millis();
  quickSort(t, 0, t.length - 1);
  ms2 = millis();
  m = ms2 - ms1;
  // print(typeof m);
  print("temps mis = " + m + " ms");
  affiche_les_n(20);
  print("Nb de swap = " + nb_swap);
}

function swap(arr, a, b) {
  let temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
  nb_swap++;
}
