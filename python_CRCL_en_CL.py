# filin = open("nombres_aleatoires_50_000.txt", "r")

# https://stacklima.com/programme-python-pour-lire-caractere-par-caractere-a-partir-dun-fichier/

# Python script to convert windows line ending CRLF to Unix LF.
# https://gist.github.com/Monal5031/85b94de036369e0676e8e5b1646cef6d
import os
windows_line_ending = b'\r\n'
linux_line_ending = b'\n'
CR = b'\r'

nf = "C:/wamp64/www/SITES/PHP_EOL_CR+LF/newfile.txt"


def motreCRLF(f):
    filin = open(nf, "rb")  # si "r" seulement on ne verra pas le \r si \r\n
    # print(filin)
    while 1:
        # read by character
        char = filin.read(1)
        if not char:
            print("fin")
            break
        elif char == '\r':
            print(r'\r')
        elif char == '\n':
            print(r'\n')
        else:
            print("->", char)
    filin.close()


nf = r'.'
# nf = r'C:\Users\detro\Downloads'
n = "nombres_aleatoires_50_000.txt"
all_files = []
for root, dirs, files in os.walk(nf):
    for name in files:
        if name == n:
            full_path = os.path.join(root, name)
            all_files.append(full_path)
for filename in all_files:
    print(filename)
    with open(filename, 'rb') as f:
        # pas besoin de fermer avec with 
        # https://docs.python.org/fr/3/tutorial/inputoutput.html#reading-and-writing-files
        content = f.read()
        if content.find(windows_line_ending) != -1:
            print("CRLF")
        if content.find(CR) != -1:
            print("CR")
        if content.find(linux_line_ending) != -1:
            print("LF")
            
        content = content.replace(windows_line_ending, linux_line_ending)
        # content = content.replace(CR, b'')
        # content = content.replace(linux_line_ending, windows_line_ending)
    with open(filename, 'wb') as f:
        f.write(content)

# # https://docs.python.org/fr/3/tutorial/inputoutput.html#reading-and-writing-files
# with open(nf, encoding="utf-8") as f:
#     read_data = f.read()
#     print(len(read_data))

# with open(nf, 'rb') as f:#la taille sera >= car car il prend en charge les CR
#     read_data = f.read()
#     print(len(read_data))
