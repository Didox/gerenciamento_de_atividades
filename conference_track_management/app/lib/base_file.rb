require 'fileutils'

class BaseFile
  PATH_CONFERENCES = File.expand_path('../../../public/files', __FILE__)
  class << self
    def save(text, another_path, name_file)
      Dir.mkdir("#{PATH_CONFERENCES}/#{another_path}") unless Dir.exists?("#{PATH_CONFERENCES}/#{another_path}")
      file_with_path = "#{PATH_CONFERENCES}/#{another_path}/#{name_file}.txt"
      File.open(file_with_path, 'w') { |file| file.write(text) }
    end

    def remove_all(another_path = '')
      path = PATH_CONFERENCES + another_path
      FileUtils.rm_rf(path)
      Dir.mkdir(path)
    end


    def read_all(another_path = '')
      all_conferences = []
      Dir["#{PATH_CONFERENCES}/#{another_path}/*.txt"].each do|file|
        text = File.read(file)
        filename = File.basename(file)
        all_conferences << "Arquivo: #{filename}\n#{text}"
      end
      all_conferences.join("\n\n\n")
    end
  end
end