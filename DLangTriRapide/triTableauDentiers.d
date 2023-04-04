module triTableauDentiers;

import std.stdio : writeln, File;
import std.stdio : writefln;
import std.file : exists;
import std.algorithm : map, sum;
import std.string : split;
import core.stdc.stdlib; //exit(1);
import std.conv : to; //to!int
import std.ascii : isDigit;
import std.algorithm.mutation; //swap
import std.datetime; //startTime
import std.string : format;

class AvecTabdEntier
{
    string s = "\nTableau d'entiers\n";
    int nb_permutations = 0;
    int[] t;
    public int[] copie;

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

    void go(string path)
    {
        if (exists(path))
        {
            auto file = File(path); // Open for reading
            file.rewind;
            auto nb_de_mots = file.byLine() // Read lines
            .map!split // Split into words
            .map!(a => a.length) // Count words per line
                .sum(); // Total word count
            //writeln("typeid() :", typeid(this.nb_de_mots));

            t.length = nb_de_mots;

            file.rewind;
            auto range = file.byLine();
            int i = 0;
            foreach (line; range)
            {
                //writeln("typeid :", typeid(line)); //type char[]
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
			copie = new int[](t.length); //taille pour la copie
			t.copy(copie); // https://dlang.org/library/std/algorithm/mutation/copy.html

            s ~= format("[ %(%s, %), ... ]", t[0 .. 10]);//http://ddili.org/ders/d.en/formatted_output.html
            auto startTime = MonoTime.currTime;
            tri_rapide(t);
            auto endTime = MonoTime.currTime;
            auto time = double((endTime - startTime).total!"usecs") / 1_000_000;
            s ~= format("\nNombre de nb_de_mots : %s\n", nb_de_mots);
            s ~= format("[ %(%s, %), ... ]\n", t[0 .. 10]);
            s ~= format("Temps mis du tri du tab d'entier en ms : %.0f\n", time * 1_000);
            s ~= format("%s permutations\n\n", nb_permutations);
        }
    }

    void tri_rapide(int[] t)
    {
        quicksort_dernier_elt(t, 0, cast(int)(t.length - 1));
    }

    //Lomuto partition scheme
    int partition_dernier_elt(int[] A, int lo, int hi)
    {
        auto pivot = A[hi];
        int i = lo;
        for (int j = lo; j < hi; j++)
        {
            if (A[j] < pivot) //ordre croissant
            {
                swap(A[i], A[j]);
                nb_permutations++;
                i = i + 1;
            }
        }
        swap(A[i], A[hi]);
        nb_permutations++;
        return i;
    }

    void quicksort_dernier_elt(int[] A, int lo, int hi)
    {
        if (lo < hi)
        {
            int p = partition_dernier_elt(A, lo, hi);
            quicksort_dernier_elt(A, lo, p - 1);
            quicksort_dernier_elt(A, p + 1, hi);
        }
    }
}