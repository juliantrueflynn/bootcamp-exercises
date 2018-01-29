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