#!/usr/bin/env ruby

class String
  def integer?
    /^[+-]?[0-9]+$/ =~ self
  end
end

def calculate_pascal_triangle
  print "Enter number of rows:\n"
  print ">>>  "
  row = gets
  unless row.integer?
    print "[Err] Please enter half-width numeric characters.\n"
    return
  end

  triangle = Array.new
  triangle << 1
  print "#{triangle}\n"

  for i in 1...row.to_i
    prev = Marshal.load(Marshal.dump(triangle))
    triangle.clear
    triangle << 1

    for j in 1...prev.size
      triangle << prev[j-1] + prev[j]
    end

    triangle << 1
    print "#{triangle}\n"
  end
end

if __FILE__ == $0
  calculate_pascal_triangle
end
