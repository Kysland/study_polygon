print("start")

a = int(input("Enter number #a: "))
b = int(input("Enter number #b: "))
c = int(input("Enter number #c: "))

if c < a and c < b:
    print(c, " is smallest number")
elif c == a and c == b:
   print(a, b, c, " are equall")
elif c == a:
    print(c, a, " are smallest numbers")
elif c == b:
    print(c, b, " are smallest numbers")
elif b < a and b < c:
    print(b, " is smallest number")
elif b == a:
    print(b, a, " are smallest numbers")
elif b == c:
    print(b, c, " are smallest numbers")
elif a < b and a < c:
    print(a, " is smallest number")
elif a == b:
    print(a, b, " are smallest numbers")
elif a == c:
    print(a, c, " are smallest numbers")

print("end")
