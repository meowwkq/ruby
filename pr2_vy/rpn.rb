def priority(oper)
  case oper
  when '+', '-'
    return 1 
  when '*', '/'
    return 2 
  else
    return 0 
  end
end

def RPN(str)
  reverse = []
  operators = [] 
  flag = 0
  str = str.gsub(/\s+/, '')
  str.each_char do |symb| 
    case symb
    when /\d/
      reverse.append(symb)
    when '+', '-', '*', '/' 
      if flag == 1
        operators.append(symb) 
      else
        while operators.any? && priority(symb) <= priority(operators.last)
          reverse.append(operators.pop)
        end
        operators.append(symb)
      end
    when '(' 
      flag = 1 
    when ')' 
      while operators.any? && operators.last != '('
        reverse.append(operators.pop)
      end
      operators.pop 
      flag = 0 
    end
  end

  while operators.any? 
    reverse.append(operators.pop)
  end

  return reverse.join(' ')
end

print "Enter an expression: "
expression = gets.chomp
rpn_expression = RPN(expression)
puts "Reverse Polish notation: #{rpn_expression}"
