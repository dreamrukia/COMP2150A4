class Hashable
  def Hashable.new(*args)
    if self == Hashable
      raise "Is not Hashable"
    else
      super
    end
  end
  
  def hashvalue
    raise "hash is an abstract method"
  end
  
end