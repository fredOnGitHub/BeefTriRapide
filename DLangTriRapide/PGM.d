//  Created by fredOnGithub on 07/02/2023.
//  Copyright © 2023 fredOnGithub. All rights reserved.
//
// compilation
// rdmd PGM.d
// ou
// dmd PGM.d  (il peut y avoir des erreurs de liens)
// ./tri_rapide_d

//debug version 64 bits
//> dmd -m64 -debug .\PGM.d  (il peut y avoir des erreurs de liens)

//debug version 64 bits
//> dmd -m32 -debug .\TriRapide.d  (il peut y avoir des erreurs de liens)

module triRapide;
import std.stdio;
import std.algorithm;
import std.range; //ByLineImpl!
import std.file; //exists
import std.ascii; //isDigit
import core.stdc.stdlib; //exit(1);
import std.conv; //to!int
import std.string; //format

void swap2(int[] A, int i, int j)
{
    int temp = A[i];
    A[i] = A[j];
    A[j] = temp;
}

bool isAnumber(char[] s)
{
    //https://dlang.org/library/std/ascii/is_digit.html Mieux
    foreach (char e; s)
    {
        //writeln("\'",e,"'");
        if (!isDigit(e))
        {
            return false;
        }
    }
    return true;
}

void fichier_dans_tab_de_int(string path, int[] t)
{
    auto file = File(path); // Open for reading
    file.rewind;
    auto range = file.byLine();
    int i = 0;
    foreach (line; range)
    {
        //writeln("typeid :",typeid(line));//type char[]
        if (isAnumber(line))
        {
            t[i++] = to!int(line);
        }
        else
        {
            writeln("Not a number in file found!");
            exit(1);
        }
    }
}

import triTableauDentiers;
import triTableauDeString;
import triTableauDeChaineDeCar;


//import fichier;

int main()
{

    string nf = "./nombres_aleatoires_50_000.txt";

    /* VERSION SUR LA SORTIE STANDARD */
    writeln("UTF8 ? 日本 éà");

    AvecTabdEntier avte = new AvecTabdEntier();
    avte.go(nf);
    writeln(avte.s);

    AvecChaineDeString acdstr = new AvecChaineDeString();
    acdstr.go(nf);
    writeln(acdstr.s);

    AvecChaineDeCar acdc = new AvecChaineDeCar();
    acdc.go(nf);
    writeln(acdc.s);



    /* VERSION SORT DU SYSTEME SUR CONSOLE ET DANS UN FICHIER */
    int[] refT = avte.copie;
    string s = "";
    s ~= "\nFonction 'Sort' entier dlang\n";
    s ~= format("[ %(%s, %), ... ]\n", refT[0 .. 10]); //http://ddili.org/ders/d.en/formatted_output.html
    import std.datetime; //startTime
    auto startTime = MonoTime.currTime;
    sort(refT);
    auto endTime = MonoTime.currTime;
    auto time = double((endTime - startTime).total!"usecs") / 1_000_000;
    s ~= format("[ %(%s, %), ... ]\n", refT[0 .. 10]);
    s ~= format("%s sec\n", time);
    writeln(s);

    /* VERSION DES TRIS DANS UN FICHIER */
    //writeln(s);
    auto path = "out.txt";
    File fw = File(path, "w"); //https://youtu.be/rwZFTnf9bDU?t=3667
    fw.writeln("UTF8 ? 日本 éà");
    fw.writeln(avte.s);
    fw.writeln(acdstr.s);
    fw.writeln(acdc.s);
    fw.writeln(s);
    fw.close();

    //while (true)
    //{
    //}

    return 0;
}