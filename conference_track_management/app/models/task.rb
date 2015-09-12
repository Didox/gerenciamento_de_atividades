class Task
  def initialize(min=nil, description=nil)
    @min = min
    @description = description
  end

  def min
    @min.to_i
  end

  def min=(min)
    @min = min
  end

  def description
    @description
  end

  def description=(description)
    @description = description
  end
end