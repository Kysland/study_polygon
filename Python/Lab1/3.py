print("start")

print("a+b>=c)
a = int(input("Enter number #a: "))
b = int(input("Enter number #b: "))
c = int(input("Enter number #c: "))

if a + b >= c and b + c >= a and a + c >= b:
    print("triangle is exist")
else:
    print("triangle isn't exist")

print("end")
