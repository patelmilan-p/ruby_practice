class Stack
  def initialize(name)
    @stack = []
    @name = name
  end

  def to_s
    @name
  end

  def empty?
    @stack.empty?
  end

  def push(element)
    @stack.push(element)
  end

  def pop
    raise("stack is empty!") if @stack.empty?
    @stack.pop
  end

  def peek
    @stack.last
  end

  def length
    @stack.length
  end
end
