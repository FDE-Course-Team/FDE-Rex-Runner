def foo(height,freq):
    freq-=1
    a=height/(freq**2)
    for i in range(freq+1):
        j=freq-i
        print("rex_jmp_list[",i,"]<=",int(height-a*j**2),';',sep="")

foo(42,12)