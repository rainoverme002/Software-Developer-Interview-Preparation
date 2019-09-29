print ("Hello I'm Trying to learn Python");
print ("My Name is Joni");

a = 12
b = 2

def add(a,b):
    c = a+b;
    return c;

def div(a,b):
    c = a/b;
    return c;

d = add(a,b);
e = div(a,b);

print (str(a) + " + " + str(b) + " " +  " = " + str(d));
print (str(a) + " / " + str(b) + " " +  " = " + str(e));