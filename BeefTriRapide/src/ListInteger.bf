using System;
using System.Collections;

namespace BeefTriRapide
{
	class IntegerList
	{
		public List<int> intList = new List<int>() ~ delete _;

		public this(int nl)
		{
		}
		public ~this()
		{
		}

		public int stringView_to_int(StringView s)
		{
			return int.Parse(s);
		}

		public void rempli_le_tableau(String path)
		{
			// new System.IO.StreamReader car on ne peut pas faire rewind au début
			// sinon utiliser un Stream
			System.IO.StreamReader sr = new System.IO.StreamReader();
			let strRea = sr.Open(path);
			if (strRea == .Ok)
			{
				//Console.WriteLine("Yes");
				//remplir le vecteur
				for (let line in sr.Lines)
				{
					intList.Add(stringView_to_int(line));
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
			//tri_fourni_par_le_langage
			if (intList.Count > 0)
				intList.Sort();
		}
		public void affiche_les_n_premiers(int n)
		{
			if (intList.Count > 0 && n > 0 && n < intList.Count)
			{
				int i = 0;
				if (n > 0)
				{
					for (let y in intList)
					{
						Console.Write(y);
						Console.Write(", ");
						i++;
						if (i == n)
							break;
					}
					Console.WriteLine();
				}
			}
		}
		public void affiche_les_n_premiers(int n, String s)
		{
			if (intList.Count > 0 && n > 0 && n < intList.Count)
			{
				if (n > 0)
				{
					//for (let y in *pt)
					for (let i in 0 ... n - 1)
					{
						s.AppendF($"{intList[i]}, ");
						if (i == n)
							break;
					}
					s.AppendF("\n");
				}
			}
		}
		void echanger(List<int> t, int a, int b)
		{
			int temp = t[a];
			t[a] = t[b];
			t[b] = temp;
		}

		int partition(List<int> arr, int start, int end)
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

		void quickSort(List<int> arr, int start, int end)
		{
			if (start >= end)
				return;
			int pivotIndex = partition(arr, start, end);
			quickSort(arr, start, pivotIndex - 1);
			quickSort(arr, pivotIndex + 1, end);
		}
	}
}