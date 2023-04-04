using System;

namespace BeefTriRapide
{
	class Program
	{
		System.Diagnostics.Stopwatch stopwatch = new System.Diagnostics.Stopwatch() ~ delete _;
		public void test()
		{
			String path = "./nombres_aleatoires_50_000.txt";
			//rempli_tri_affiche_le_vecteur(path);
			int nl = Fichier.nb_lines(path);
			if (nl > 0)
			{
				String s = scope String()..AppendF("");
				s.AppendF("UTF8 ? 日本 éà");
				s.AppendF("\n\nFichier de : {} éléments", nl);


				s.AppendF("\n\nTest d'un tableau dynamique comme en C\n");
				ArrayIntegerRaw integerRAW = new ArrayIntegerRaw(nl);
				integerRAW.rempli_le_tableau(path);
				stopwatch.Restart();
				integerRAW.quicksort();
				stopwatch.Stop();
				int i = stopwatch.ElapsedMilliseconds;
				s.AppendF("Time elapsed in millis : {}\n", i);
				integerRAW.affiche_les_n_premiers(10,  s);


				s.AppendF("\n\nTest d'un tableau Beef\n");
				ArrayInteger integerBeef = new ArrayInteger(nl);
				integerBeef.rempli_le_tableau(path);
				stopwatch.Restart();
				integerBeef.quicksort();
				stopwatch.Stop();
				i = stopwatch.ElapsedMilliseconds;
				s.AppendF("Temps mis du tri du tab d'entier en ms : {}\n", i);
				integerBeef.affiche_les_n_premiers(10,  s);


				s.AppendF("\n\nTest d'une liste d'entiers et la fonction sort qui est intégrée\n");
				IntegerList integerList = new IntegerList(nl);
				integerList.rempli_le_tableau(path);
				stopwatch.Restart();
				integerList.quicksort();
				stopwatch.Stop();
				i = stopwatch.ElapsedMilliseconds;
				s.AppendF("Time elapsed in millis : {}\n", i);
				integerBeef.affiche_les_n_premiers(10,  s);


				Fichier.ecrire_dans_fichier("out.txt", s);
				Console.WriteLine(s);
				Console.WriteLine("\n\n");
				integerRAW.affiche_les_n_premiers(10);
				integerBeef.affiche_les_n_premiers(10);
				integerList.affiche_les_n_premiers(10);

				/*Vérifier si les tableaux sont égaux*/
				i = 0;
				for (let y in integerList.intList)
				{
					if (y != integerRAW.pt[i])
					{
						Console.WriteLine("FALSE!");
						break;
					}
					if (y != integerBeef.pt[i])
					{
						Console.WriteLine("FALSE!");
						break;
					}
					i++;
				}
				delete integerRAW;
				delete integerBeef;
				delete integerList;
			}
		}

		static void Main()
		{
			Console.WriteLine("Main()");
			Program P = new Program();
			P.test();
			delete P;
			/*for (int i < 10)
			{
				defer:: Console.WriteLine("i={}", i);
			}*/
			/*while (true) { }*/
		}
	}
}
