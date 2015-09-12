require 'rspec'
require File.expand_path('../../spec_helper', __FILE__)

describe Conference  do
  describe 'parse' do
    describe 'tasks_to_conference' do
      before do
        t1 = StringToTask.parse('Writing Fast Tests Against Enterprise Rails 60min')
        t2 = StringToTask.parse('Overdoing it in Python 45min')
        t3 = StringToTask.parse('Lua for the Masses 30min')
        t4 = StringToTask.parse('Ruby Errors from Mismatched Gem Versions 45min')
        t5 = StringToTask.parse('Common Ruby Errors 45min')
        t6 = StringToTask.parse('Rails for Python Developers lightning')
        t7 = StringToTask.parse('Communicating Over Distance 60min')
        t8 = StringToTask.parse('Accounting-Driven Development 45min')
        t9 = StringToTask.parse('Woah 30min')
        t10 = StringToTask.parse('Sit Down and Write 30min')
        t11 = StringToTask.parse('Pair Programming vs Noise 45min')
        t12 = StringToTask.parse('Rails Magic 60min')
        t13 = StringToTask.parse('Ruby on Rails: Why We Should Move On 60min')
        t14 = StringToTask.parse('Clojure Ate Scala (on my project) 45min')
        t15 = StringToTask.parse('Programming in the Boondocks of Seattle 30min')
        t16 = StringToTask.parse('Ruby vs. Clojure for Back-End Development 30min')
        t17 = StringToTask.parse('Ruby on Rails Legacy App Maintenance 60min')
        t18 = StringToTask.parse('A World Without HackerNews 30min')
        t19 = StringToTask.parse('User Interface CSS in Rails Apps 30min')
        tasks = [t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19]
        @conference = described_class.tasks_to_conference(tasks)
      end


      it 'do' do
        expect(@conference).not_to be nil
        expect(@conference.tracks).not_to be nil
        expect(@conference.tracks.class).to be Array
        expect(@conference.tracks.size).to eq 2
        compromises_size = @conference.tracks[0].compromises.size + @conference.tracks[1].compromises.size
        expect(compromises_size).to eq 19
      end

      it 'to_s' do
        expect(@conference.to_s).to eq "Track 1\n09:00 Writing Fast Tests Against Enterprise Rails\n10:00 Overdoing it in Python\n10:45 Lua for the Masses\n11:15 Woah\n11:45 Rails for Python Developers lightning\n13:00 Ruby Errors from Mismatched Gem Versions\n13:45 Common Ruby Errors\n14:30 Communicating Over Distance\n15:30 Accounting-Driven Development\n16:15 Sit Down and Write\n\nTrack 2\n09:00 Pair Programming vs Noise\n09:45 Rails Magic\n10:45 Ruby on Rails: Why We Should Move On\n13:00 Clojure Ate Scala (on my project)\n13:45 Programming in the Boondocks of Seattle\n14:15 Ruby vs. Clojure for Back-End Development\n14:45 Ruby on Rails Legacy App Maintenance\n15:45 A World Without HackerNews\n16:15 User Interface CSS in Rails Apps\n"
      end

      it 'to_complete_s' do
        sconference = @conference.to_complete_s
        expect(sconference).to match(/Inicio:/)
        expect(sconference).to match(/Fim:/)
        expect(sconference).to match(/[0-9][0-9]\/[0-9][0-9]\/[0-9][0-9][0-9][0-9] [0-9][0-9]:[0-9][0-9]/) # validade complete datetime
      end

      it 'save' do
        expect(@conference.respond_to?(:save)).to be true
      end

      it 'delete_all' do
        expect(described_class.respond_to?(:delete_all)).to be true
      end

      it 'read_all_confereces' do
        expect(described_class.respond_to?(:read_all_confereces)).to be true
      end
    end
  end

  describe 'instance' do
    before do
      @conference = described_class.new
    end

    it 'attributes of class' do
      expect(@conference.respond_to?(:tracks)).to be true
    end

    it 'setters of class' do
      @conference.tracks = []
      expect(@conference.tracks).to eq []
    end
  end
end