class Track
  def initialize(name = nil, compromises = nil)
    @name = name
    @compromises = compromises
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def compromises
    @compromises
  end

  def compromises=(compromises)
    @compromises = compromises
  end
end