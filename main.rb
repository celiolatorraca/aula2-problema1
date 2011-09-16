class CalculatorForCrazySequence
  
  attr_writer :number
  
  def initialize number = 1
    @number = number
    @map = Hash.new
  end
  
  def calculate_recursive number = @number, qntd = 1
    if number != 1
      if number.odd?
        qntd = calculate_recursive 3*number + 1, qntd + 1
      else
        qntd = calculate_recursive number/2, qntd + 1
      end
    end
    
    qntd
  end
  
  def calculate_iterative
    qntd = 1
    number = @number

    while number > 1
      if number.odd?
        number = 3*number + 1
      else
        number = number/2
      end
      
      qntd += 1
    end

    qntd
  end
  
  def calculate_iterative_optimized
    qntd = 1
    number = @number

    while number > 1
      if !@map[number].nil?
        qntd += @map[number] - 1
        break
      elsif number.odd?
        number = 3*number + 1
      else
        number = number/2
      end
      
      qntd += 1
    end

    @map[@number] = qntd
    qntd
  end
  
  def calculate algorithm
    if self.respond_to? algorithm
      self.send(algorithm)
    else
      raise "[ERRO] Metodo :#{algorithm} nao encontrado em #{self.class}!"
    end
  end
  
end


max = 0
numero = 0

calculator = CalculatorForCrazySequence.new

#1000000.times do |i| #tem que usar i+1
for num in 1..1_000_000
  calculator.number = num
  # No ruby 1.9.2 pode usar o calculator.calculate :calculate_iterative ou :calculate_recursive
  qntd = calculator.calculate_iterative_optimized
  
  if qntd >= max
    max = qntd
    numero = num
  end
  
end

if max > 0
  puts "Numero: #{numero} - #{max}"
end
