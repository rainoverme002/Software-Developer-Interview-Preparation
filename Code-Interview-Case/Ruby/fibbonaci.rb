a = Array.new
a[0] = 0
for i in 0..100
    if i==0
        a[i+1] = a[i] + 1
    else
        a[i+1] = a[i] + a[i-1]
    end
    puts a[i]
end
