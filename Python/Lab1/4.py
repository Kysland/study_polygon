#hz pravilno schitaet ili net, y menya 1 bal iz 100 po mateshe

from math import sqrt

print("start")

print("ax^2 + bx + c =0")
a = int(input("Enter number #a: "))
b = int(input("Enter number #b: "))
c = int(input("Enter number #c: "))

D = b ** 2 - 4 * a * c
print("discriminant = ", D)

if a == 0:
    print("eto ne ^2 yravnenie")
elif D > 0:
    #x1 = -b + D**(1./2) / (2 * a)
    #x2 = -b + D**(1./2) / (2 * a)
    x1 = (-b + sqrt(D)) / (2 * a)
    x2 = (-b - sqrt(D)) / (2 * a)
    print("x1 = ", x1)
    print("x2 = ", x2)
elif D == 0:
    x = -b / (2 * a)
    print("x = ", x)
else:
    print("no roots")
    
print("end")
