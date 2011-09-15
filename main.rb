class CalculatorCrazySequence
  
  attr_writer :number
  
  def initialize number = 1
    @number = number
  end
  
  def calculate_recursive number = @number, qntd = 1
    if number != 1
      if number.odd?
        qntd = calculate_recursive 3*number+1, qntd+1
      else
        qntd = calculate_recursive number/2, qntd+1
      end
    end
    
    qntd
  end
  
  def calculate_iterative
    qntd = 1
    
    while @number > 1
      if @number.odd?
        @number = 3*@number+1
      elsif
        @number = @number/2
      end
      
      qntd += 1
    end
    
    qntd
  end
  
  def calculate algorithm
    if algorithm == :calculate_recursive
      self.calculate_recursive
    else
      self.calculate_iterative
    end
  end
  
end


max = 0
numero = 0

calculator = CalculatorCrazySequence.new

#1000000.times do |i| #tem que usar i+1
for i in 1..1_000_000
  calculator.number = i
  qntd = calculator.calculate :calculate_iterative
  
  if qntd >= max
    max = qntd
    numero = i
  end
  
end

puts "Numero: #{numero} - #{max}"