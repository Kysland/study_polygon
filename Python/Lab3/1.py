print("start")
b = []
c = int(0)
a = int(input("Enter number: "))
b.append(a)
c = c + 1
while a > 0:
    if a < 0:
        print("End of entering")
    else:
        a = int(input("Enter number: "))
        b.append(a)
        c = c + 1
print("User enter: ", + c, "numbers")
print(b)
#check for unique
z = {}
for f in b:
    if f in z:
        z[f] += 1
    else:
        z[f] = 1
sorted(z)
print("Counting of repetitions:")
print(z)
print("end")
    
