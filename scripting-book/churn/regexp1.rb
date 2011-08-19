require 'test/unit'

class RegExp < Test::Unit::TestCase

  def rearrange(name)
    /(\w+), (\w+)\s*(\w*)/.match(name)
    !$3.empty? ? "#{$2} #{$3[0]}. #{$1}" : "#{$2} #{$1}"
  end

  def test_rearrange_with_middle_name
    assert_equal("Dawn E. Marick" ,
    rearrange("Marick, Dawn Elaine" ))
  end

  def test_rearrange_without_middle_name
    assert_equal("Paul Marick" , rearrange("Marick, Paul" ))
  end

end
