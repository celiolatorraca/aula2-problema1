def sequencia_doida num, index  
  #print "#{num} "
  
  if num != 1
    if num.odd?
      index = sequencia_doida 3*num+1, index+1
    else
      index = sequencia_doida num/2, index+1
    end
  end
  
  index
end

max = 0
numero = 0

#1000000.times do |i| #tem que usar i+1
for i in 1..1000000
  qntd = sequencia_doida i, 1
  if qntd >= max
    max = qntd
    numero = i
  end
end

puts "Numero: #{numero} - #{max}"