require 'rspec'
require File.expand_path('../../spec_helper', __FILE__)

describe Track do
  describe 'about the class' do
    it 'constructor' do
      compromises = [Compromise.new, Compromise.new]
      t = described_class.new('track', compromises)
      expect(t.compromises).to eq compromises
    end
  end
  
  describe 'instance' do
    before do
      @track = described_class.new
    end

    it 'attributes of class' do
      expect(@track.respond_to?(:compromises)).to be true
    end

    it 'setters of class' do
      compromises = [Compromise.new, Compromise.new]
      @track.compromises = compromises
      expect(@track.compromises).to eq compromises

      @track.name = 'track'
      expect(@track.name).to eq 'track'
    end
  end
end
