using System;

namespace BeefTriRapide
{
	class ArrayInteger
	{
		public int[] pt;
		int taille;
		public this(int nl)
		{
			taille = nl;
			pt = new int[nl];
		}
		public ~this()
		{
			delete pt;
		}

		public int stringView_to_int(StringView s)
		{
			return int.Parse(s);
		}
		public void test_tableau()
		{
			int[] t = new int[3](9, 5, 0);
			int o = t[4]; //ERROR: Index out of range sera levée
			Console.Write("Valeur de o : ");
			Console.WriteLine(o);
			for (int i in 0 ... 2)
			{
				Console.Write(t[i]);
				Console.Write(", ");
			}
			Console.WriteLine();
			delete t;
		}
		public void rempli_le_tableau(String path)
		{
			// new System.IO.StreamReader car on ne peut pas faire rewind au début
			// sinon utiliser un Stream
			System.IO.StreamReader sr = new System.IO.StreamReader();
			let strRea = sr.Open(path);
			if (strRea == .Ok)
			{
				int i = 0;
				//Console.WriteLine("Yes");
				//remplir le vecteur
				for (let line in sr.Lines)
				{
					pt[i] = stringView_to_int(line);
					i++;
				}
			}
			else
			{
				Console.WriteLine("No good file...");
			}
			delete sr;
		}
		public void quicksort()
		{
			if (taille > 0)
				quickSort(pt, 0, taille - 1);
		}
		public void affiche_les_n_premiers(int n)
		{
			if (taille > 0 && n > 0 && n < taille)
			{
				if (n > 0)
				{
					for (let i in 0 ... n - 1)
					{
						Console.Write(pt[i]);
						Console.Write(", ");
						if (i == n)
							break;
					}
					Console.WriteLine();
				}
			}
		}
		public void affiche_les_n_premiers(int n, String s)
		{
			if (taille > 0 && n > 0 && n < taille)
			{
				if (n > 0)
				{
					//for (let y in *pt)
					for (let i in 0 ... n - 1)
					{
						s.AppendF($"{pt[i]}, ");
						if (i == n)
							break;
					}
					s.AppendF("\n");
				}
			}
		}
		void echanger(int[] t, int a, int b)
		{
			int temp = t[a];
			t[a] = t[b];
			t[b] = temp;
		}

		int partition(int[] arr, int start, int end)
		{
			int pivotValue = arr[end];
			int pivotIndex = start;
			for (int i = start; i < end; i++)
			{
				if (arr[i] < pivotValue)
				{
					echanger(arr, i, pivotIndex);
					pivotIndex += 1;
				}
			}
			echanger(arr, pivotIndex, end);
			return pivotIndex;
		}

		void quickSort(int[] arr, int start, int end)
		{
			if (start >= end)
				return;
			int pivotIndex = partition(arr, start, end);
			quickSort(arr, start, pivotIndex - 1);
			quickSort(arr, pivotIndex + 1, end);
		}
	}
}