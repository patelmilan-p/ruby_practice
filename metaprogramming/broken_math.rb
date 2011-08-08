class Fixnum
  alias :old_plus :+
  def +(num)
    self.old_plus(num).old_plus(1)
  end
end
