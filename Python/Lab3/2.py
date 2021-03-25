from random import random
print("start")
a = int(input("Enter the length of lists: "))
b = [0] * a
c = [0] * a
z = []
z1 =[]
a1 = 42
for i in range(a):
    b[i] = int(random() * 100)
for i in range(a):
    c[i] = int(random() * 100)
print("List 1")
b.sort() #dlya ydobstva sravnenya
print(b)
print("List 2")
c.sort() #dlya ydobstva sravnenya
print(c)
for i in b:
    if i not in c:
        z.append(i)
        z.sort()
print("These numbers are only in the first list")
print(z)
if a1 in z:
    print("ОТВЕТ НА ГЛАВНЫЙ ВОПРОС ЖИЗНИ ПРИСУТСВТУЕТ")
for i in c:
    if i not in b:
        z1.append(i)
        z1.sort()
print("These numbers are only in the second list")
print(z1)
if a1 in z1:
    print("ОТВЕТ НА ГЛАВНЫЙ ВОПРОС ЖИЗНИ ПРИСУТСВТУЕТ")
print("end")
