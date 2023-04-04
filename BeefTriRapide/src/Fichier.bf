using System;
using System.Collections;

namespace BeefTriRapide
{
	class Fichier
	{
		public static void test_write_read_in_file()
		{
			String path = "./Hello.txt";
			String str = "This is a string";
			System.IO.File.WriteAllText(path, str);
			String FileData = new String(); // car realloc avec ReadAllText !
			System.IO.File.ReadAllText(path, FileData);
			String st = FileData;
			Console.Write("File content:  ");
			Console.WriteLine(st);
			delete FileData;
		}
		public static void ecrire_dans_fichier(String path, String str)
		{
			System.IO.File.WriteAllText(path, str);
		}

		public static int nb_lines(String path)
		{
			// new System.IO.StreamReader car on ne peut pas faire rewind au début
			// sinon utiliser un Stream
			System.IO.StreamReader sr = new System.IO.StreamReader();
			int i = 0;
			let strRea = sr.Open(path);
			if (strRea == .Ok)
			{
				for (let line in sr.Lines)
				{
					i++;
				}
				//Console.Write("Nombre de ligne : ");
				//Console.WriteLine(i);
			}
			delete sr;
			return i;
		}

		public this(String path)
		{
			Console.WriteLine("Fichier()");
		}
		public ~this()
		{
			Console.WriteLine("~Fichier()");
		}
	}
}