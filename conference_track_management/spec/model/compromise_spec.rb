require 'rspec'
require File.expand_path('../../spec_helper', __FILE__)

describe Compromise  do
  describe 'instance' do
    before do
      @compromise = described_class.new
    end

    it 'attributes of class' do
      expect(@compromise.respond_to?(:start_time)).to be true
      expect(@compromise.respond_to?(:end_time)).to be true
      expect(@compromise.respond_to?(:description)).to be true
    end

    it 'setters of class' do
      time = Time.now
      
      @compromise.start_time = time
      expect(@compromise.start_time).to eq time

      @compromise.end_time = time
      expect(@compromise.end_time).to eq time

      @compromise.description = 'one description'
      expect(@compromise.description).to eq 'one description'
    end
  end
end
