print("start")

def funk1():
    a = int(input("Enter number: "))
    b = 0
    while a > 0:
            c = a % 10
            a = a // 10
            b += c
    print(b)
funk1()

print("end")
    
