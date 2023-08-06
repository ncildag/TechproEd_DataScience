def find_fact(x):
    """Girilen sayinin faktoriyelini dondurur"""
    carpim_degeri = 1
    for i in range(x,0,-1):
        carpim_degeri *= i
    return carpim_degeri

def find_hypo(x,y):
    return (x ** 2 + y ** 2) ** 0.5

pi = 3.14

e = 2.7182