
import os
import shutil

liste_files = [".class", ".out", ".exe", ".pdb", ".obj"]
liste_dir = [".vscode", "__pycache__", "recovery", "build"]

for path, d_names, f_names in os.walk("."):
    # print(path, d_names, f_names)
    if ".git" not in path:
        # print("",path, d_names, f_names)
        for dir in d_names:
            if dir in liste_dir:
                f = os.path.join(path, dir)
                print(f)
                # os.rmdir(f)# erreur si pas vide
                shutil.rmtree(f)
        for file in f_names:
            split_tup = os.path.splitext(file)
            file_name = split_tup[0]
            file_extension = split_tup[1]
            if file_extension in liste_files:
                f = os.path.join(path, file)
                print(f)
                os.remove(f)
                # print()

exit(0)

# https://pynative.com/python-delete-files-and-directories/ shutil.rmtree('dir_path')	Delete a directory and the files contained in it.

# # https://www.digitalocean.com/community/tutorials/python-check-if-string-contains-another-string
# str1 = 'I love Python Programming'
# str2 = 'python'
# str3 = 'Java'
# print(f'"{str1}" contains "{str2}" = {str2 in str1}')
# print(f'"{str1}" contains "{str2.lower()}" = {str2.lower() in str1.lower()}')
# print(f'"{str1}" contains "{str3}" = {str3 in str1}')
# if str2 in str1:
#     print(f'"{str1}" contains "{str2}"')
# else:
#     print(f'"{str1}" does not contain "{str2}"')
