require 'rspec'
require File.expand_path('../../spec_helper', __FILE__)

describe StringToTask  do
  describe 'parse' do
    it 'parse with two minutes' do
      expect { StringToTask.parse('Writing Fast Tests Against Enterprise Rails 60min and 30min') }.
      to raise_error(StringToTaskError, 'Somente uma seção em minutos será permitida em sua task')

    end

    it 'parse with no minutes' do
      task = StringToTask.parse('Rails for Python Developers lightning')
      expect(task.class).to eq Task
      expect(task.min).to eq 0
      expect(task.description).to eq 'Rails for Python Developers lightning'
    end

    it 'simple parse' do
      task = StringToTask.parse('Writing Fast Tests Against Enterprise Rails 60min')
      expect(task.class).to eq Task
      expect(task.min).to eq 60
      expect(task.description).to eq 'Writing Fast Tests Against Enterprise Rails'
    end
  end
end
