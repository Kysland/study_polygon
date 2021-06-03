print("Start")
with open('input.txt', 'r+') as a:
    b = []
    b1 = []
    b2 =[]
    full_a = a.read()
    for i in full_a.split():
        b.append(int(i))
    print("Max number:")
    print(max(b))
    print("Min number:")
    print(min(b))
    b1 = b
    '''for i in b:
        if i not in b1:
            b2.append(i)'''
    b2 = list(set(b))
    print("Unique")
    print(b2)
print("End")
