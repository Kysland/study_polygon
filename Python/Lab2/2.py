print("start")

def get_less():
    list1 = []
    #list2 = []
    print("Enter 5 numbers")
    for a in range(5):
        b = int(input("Enter number: "))
        list1.append(b)
    c = int(input("Enter number for min sort: "))
    m1 = [i for i in list1 if i < c]
    #list2.sort(list1, c) - typoi debil
    print(m1)
    
get_less()

    #return [elem for elem in arr if elem < val] -  help ot komrade

print("end")
    
