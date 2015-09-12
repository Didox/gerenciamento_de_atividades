require 'rspec'
require File.expand_path('../../spec_helper', __FILE__)

describe Task  do
  describe 'about the class' do
    it 'constructor' do
      t = described_class.new(40, 'one description')
      expect(t.min).to eq 40
      expect(t.description).to eq 'one description'
    end
  end

  describe 'instance' do
    before do
      @task = described_class.new
    end

    it 'attributes of class' do
      expect(@task.respond_to?(:min)).to be true
      expect(@task.respond_to?(:description)).to be true
    end

    it 'setters of class' do
      @task.min = 40
      expect(@task.min).to eq 40

      @task.description = 'one description'
      expect(@task.description).to eq 'one description'
    end
  end
end
