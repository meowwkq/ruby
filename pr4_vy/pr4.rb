def pie_valid?(pie)
  pie.each do |row|
    return false if row.count("o") != 1
  end
  true
end

def pie_info(pie)
  width = pie[0].length
  height = pie.length
  total_o = pie.sum { |row| row.count("o") }
  [total_o, width, height]
end

def horizontal_cut(pie, n, height)
  answer = []
  str = ""
  stopper = height / n
  pie.each do |row|
    str += "\n" + row
    if (str.count("\n") + 1) == stopper
      answer << str
      str = ""
    end
  end
  answer << str unless str.empty?  
  answer
end


def vertical_cut(pie, n, width)
  answer = []
  colnum = width / n
  str = ""
  (0...n).each do |c|
    pie.each do |row|
      str += row[c * colnum, colnum] + "\n"
    end
    answer << str
    str = ""
  end
  answer.last << "\n"
  answer
end

def ways_to_cut(pie, n)
  total_o, width, height = pie_info(pie)
  return [] if (width * height) % n != 0

  horizontal = horizontal_cut(pie, n, height)
  vertical = vertical_cut(pie, n, width)

  [horizontal, vertical]
end

pie = [
  ".o......",
  "......o.",
  "....o...",
  "..o.....",
]

n = 4

possible_ways = ways_to_cut(pie, n)

if possible_ways.empty?
  puts "There are no possible ways to cut the pie into #{n} equal parts."
else
  puts "Possible ways to cut the pie into #{n} equal parts:"
  possible_ways.each do |way|
    puts way.join("\n")
  end
end