# O(n^2)
def sluggish_octopus(octopi)
  octopi.each do |octopus|
    longest = true
    
    octopi.each do |octopus2|
      next if octopus == octopus2
      longest = false if octopus2.length > octopus.length
    end
    
    return octopus if longest
  end
end

def dominant_octopus(octopi)
  return octopi if octopi.length <= 1

  mid_idx = octopi.length / 2
  merge_dominant_octopus(
    dominant_octopus(octopi.take(mid_idx)),
    dominant_octopus(octopi.drop(mid_idx)),
  )
end

def merge_dominant_octopus(left, right)
  merged_array = []
  prc = Proc.new { |num1, num2| num2.length <=> num1.length }

  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      merged_array << left.shift
    when 0
      merged_array << left.shift
    when 1
      merged_array << right.shift
    end
  end

  merged_array
end