def ip_address?(str)

  parts = str.split(".")
  return unless parts.length == 4 

  parts.all? do |part|
    is_numeric = part.match?(/^\d{1,3}$/)
    is_in_range = part.to_i >= 0 && part.to_i <= 255
    has_no_leading_zeros = part.to_i.to_s == part

    is_numeric && is_in_range && has_no_leading_zeros
  end
end

puts ip_address?("181.172.23.9") 
puts ip_address?("032.619.789.666")