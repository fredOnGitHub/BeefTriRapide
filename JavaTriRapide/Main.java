
// Created by fredOnGithub on 02/2023

// compilation & exécution
// clear;javac Main.java;java Main
// Measure-Command { java Main } > temps.txt

// installation de java JRE & JDK
// https://www.oracle.com/fr/java/technologies/downloads/

// Installation des JRE et JDK dans Linux Ubuntu
// https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04

public class Main {

    public static void main(String[] args) {

        // String s = "é ";
        // System.out.println(s);
        // TriRapideArrayInt.test_ecrire_dans_fichier_texte(s);
        // System.exit(0);

        TriRapideArrayInt tr = new TriRapideArrayInt();

        // https://web.maths.unsw.edu.au/~lafaye/CCM/java/javatype.htm
        tr.s += ("Byte.MAX_VALUE = " + Byte.MAX_VALUE);
        tr.s += ("\nInteger.MAX_VALUE = " + Integer.MAX_VALUE);
        tr.s += ("\nShort.MAX_VALUE = " + Short.MAX_VALUE);
        tr.s += ("\nInteger.MAX_VALUE = " + Integer.MAX_VALUE);
        tr.s += ("\nLong.MAX_VALUE = " + Long.MAX_VALUE);
        tr.s += ("\nFloat.MAX_VALUE = " + Float.MAX_VALUE);
        tr.s += ("\nDouble.MAX_VALUE = " + Double.MAX_VALUE);

        System.out.println("\nCharacter.MAX_VALUE = " + (Character.MAX_VALUE + 0));
        // https://stackoverflow.com/questions/23413497/how-to-print-max-value-of-character
        tr.s += "\n\n";
        tr.s += ("UTF8 ? 日本 éà\n");
        tr.s += ("((Math.pow(2, 31) - 1) == Integer.MAX_VALUE) : " + ((Math.pow(2, 31) - 1) == Integer.MAX_VALUE));

        tr.s += ("\n\nTri avec des entiers signés sur 32 bits\n");
        tr.fichier_texte_vers_tab_de_int("nombres_aleatoires_50_000.txt");

        // va tout mettre dans une String
        tr.les_n_premiers(10);
        // tr.les_n_premiers(20);
        tr.trie_et_obtient_le_temps();
        tr.les_n_premiers(10);
        System.out.println(tr.s);
        tr.res_dans_fichier_texte();
    }
}
