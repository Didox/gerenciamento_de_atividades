require File.expand_path('../task', __FILE__)

class Compromise < Task
  def start_time
    @start_time
  end

  def start_time=(start_time)
    @start_time = start_time
  end
  
  def end_time
    @end_time
  end

  def end_time=(end_time)
    @end_time = end_time
  end
end