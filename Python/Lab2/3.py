print("start")

#def check_palindrome():
import string
a = str(input("Enter word: "))
b = a.lower() #сводим всё к одному регистру
b1 = b.split() #делим строку на список
b2 = "".join(b1) #собираем строку из списка без пробелов
b3 = b2.strip(",'.'!")

'''C = ",", ".", "!", "?"
for i in range(len(b3)):
    d = b3.replace(c[i], "")'''

d = "".join(i for i in b3 if i not in ("!",",",".",":")) #убираем знаки препин

if d == d[::-1]: #проверка на полиндромность 
    print(d)
    print("da polindrom")
else:
    print(d)
    print("net ne polindrom")

print("end")
