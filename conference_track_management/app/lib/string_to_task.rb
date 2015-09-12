require File.expand_path('../string_to_task_error', __FILE__)

class StringToTask
  def self.parse(string)
    time_of_string = extractor(string)
    if time_of_string.size > 1
      raise StringToTaskError, 'Somente uma seção em minutos será permitida em sua task'
    elsif time_of_string.size < 1
      Task.new 0, string
    else
      stime = time_of_string.first
      min = stime.delete('min').to_i
      description = string.gsub(stime, '').strip

      Task.new min, description
    end
  end

  def self.extractor(string)
    string.scan(/[0-9].*?min/)
  end
end