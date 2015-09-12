require 'rspec'
require File.expand_path('../../spec_helper', __FILE__)

describe BaseFile  do
  describe 'read write and delete folders and files' do
    it 'save' do
      FileUtils.rm_rf("#{BaseFile::PATH_CONFERENCES}/test")
      BaseFile.save('text', 'test', 'test_file')
      file_with_path = "#{BaseFile::PATH_CONFERENCES}/test/test_file.txt"
      expect(File.exist?(file_with_path)).to be true
    end

    it 'read_all' do
      BaseFile.remove_all
      5.times do |i|
        BaseFile.save("text#{i}", 'test', "test_file#{i}")
      end
      
      text = BaseFile.read_all('test')

      5.times do |i|
        expect(text).to match(/Arquivo: test_file#{i}.txt/)
        expect(text).to match(/text#{i}/)
      end
    end

    it 'remove_all' do
      BaseFile.save('text', 'test', 'test_file_remove')
      BaseFile.remove_all
      file_with_path = "#{BaseFile::PATH_CONFERENCES}/test/test_file_remove.txt"
      expect(File.exist?(file_with_path)).to be false
    end
  end
end
