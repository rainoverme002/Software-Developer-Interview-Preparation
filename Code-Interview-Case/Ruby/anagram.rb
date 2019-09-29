x=['dog','ear', 'pu', 'egg', 'god', 'up','ogd','gge','aer']
y=Array.new(x)

print ("Array Sebelum :\n")
puts x

for i in 0..8
  y[i]=x[i].chars.sort.join
end
for i in 0..8
  for j in i+1..8
    if y[i] == y[j]
      passingdatax = x[j]
      passingdatay = y[j]
      posisi = j
      for n in posisi.downto(i+1) do
        x[n] = x[n-1]
        y[n] = y[n-1]
      end
      x[i+1] = passingdatax
      y[i+1] = passingdatay
    end
  end
end

print ("Array Sesudah :\n")
puts x
