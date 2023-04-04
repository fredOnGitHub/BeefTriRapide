
// Created by fredOnGithub on 02/2023

// compilation & exécution
// clear;javac Main.java;java Main

import static java.lang.System.*;

import java.io.File;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

public class TriRapideArrayInt {

    private static List<String> listeDeString = new ArrayList<String>();
    public static int[] arrayInt = null;
    int nb_swap = 0;
    public String s = "";

    public static void triRapide(int[] tableau) {// constructeur
        int longueur = tableau.length;
        triRapide(tableau, 0, longueur - 1);
    }

    private static void triRapide(int[] tableau, int deb, int fin) {
        if (deb >= fin)
            return;
        int positionPivot = partition(tableau, deb, fin);
        triRapide(tableau, deb, positionPivot - 1);
        triRapide(tableau, positionPivot + 1, fin);
    }

    private static int partition(int[] tableau, int deb, int fin) {
        int pivotIndex = deb;
        int pivotValeur = tableau[fin];

        for (int i = deb; i < fin; i++) {
            if (tableau[i] < pivotValeur) {
                echanger(tableau, i, pivotIndex);
                pivotIndex++;
            }
        }
        echanger(tableau, pivotIndex, fin);
        return (pivotIndex);
    }

    private static void echanger(int[] tableau, int a, int b) {
        int temp = tableau[a];
        tableau[a] = tableau[b];
        tableau[b] = temp;
    }

    public void les_n_premiers(int n) {
        String c = "";
        int[] t = arrayInt;// une réf
        if (n > 0) {
            if (t != null) {
                if (t.length > 0) {
                    c += "[ ";
                    int i = 0;
                    for (; i < (n - 1) && i < t.length; i++) {
                        c += (t[i] + ", ");
                    }
                    c += t[i];
                    if (n < t.length)
                        c += " , ... ]";
                    else
                        c += " ]";
                    c += "\n";
                }
            } else {
                c += "t == null !!\n";
            }
        } else {
            c += "ERREUR\n";
        }
        s += c;
    }

    public void trie_et_obtient_le_temps(int[] t) {
        long endTime = nanoTime();
        triRapide(t);
        endTime = nanoTime() - endTime;
        // s += ("Temps mis du tri du tab d'entier en ms : " + endTime / Math.pow(10.0, 6));
        s += String.format("Temps mis du tri du tab d'entier en ms : %.0f\n", endTime / Math.pow(10.0, 6));
    }

    public void trie_et_obtient_le_temps() {
        if (arrayInt != null) {
            trie_et_obtient_le_temps(arrayInt);
        }
    }

    // https://www.delftstack.com/fr/howto/java/open-a-file-in-java/
    // https://waytolearnx.com/2020/03/lire-un-fichier-ligne-par-ligne-en-java.html
    public int fichier_texte_vers_tab_de_int(String nomFich) {
        int i = 0;
        try {
            // Le fichier d'entrée
            File file = new File(nomFich);
            // Créer l'objet File Reader
            FileReader fr = new FileReader(file);
            // Créer l'objet BufferedReader
            BufferedReader br = new BufferedReader(fr);
            // StringBuffer sb = new StringBuffer();
            String line;
            while ((line = br.readLine()) != null) {
                // sb.append(line);
                // sb.append("\n");
                i++;
                listeDeString.add(line);
            }
            fr.close();
            arrayInt = new int[listeDeString.size()];
            for (int k = 0; k < listeDeString.size(); k++) {
                // !! Normalement il faut vérifier si la conversion est bien faite
                arrayInt[k] = Integer.parseInt(listeDeString.get(k));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        s += (i + " lignes lues\n");
        return i;
    }

    public void res_dans_fichier_texte() {
        // https://www.codeurjava.com/2016/04/ecrire-dans-un-fichier-en-java-BufferedWriter.html
        try {
            String nf = "out.txt";
            File file = new File(nf);
            // créer le fichier s'il n'existe pas
            if (!file.exists()) {
                file.createNewFile();
            }
            FileWriter fw = new FileWriter(file.getAbsoluteFile());
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(s);
            bw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void test_ecrire_dans_fichier_texte(String s) {
        // https://www.codeurjava.com/2016/04/ecrire-dans-un-fichier-en-java-BufferedWriter.html
        try {
            String nf = "test.txt";
            File file = new File(nf);
            // créer le fichier s'il n'existe pas
            if (!file.exists()) {
                file.createNewFile();
            }
            FileWriter fw = new FileWriter(file.getAbsoluteFile());
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(s);
            bw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
