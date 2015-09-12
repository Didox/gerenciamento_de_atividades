require 'time'

class Conference
  START_FIRST_TIME = Time.parse('09:00:00')
  TIME_TO_LANCH = Time.parse('12:00:00')
  START_SECOND_TIME = Time.parse('13:00:00')
  END_TIME = Time.parse('17:00:00')

  def tracks
    @tracks
  end

  def tracks=(tracks)
    @tracks = tracks
  end

  def to_s
    aconferece = []
    tracks.each  do |track|
      aconferece << track.name
      track.compromises.each do |compromise|
        aconferece << "#{compromise.start_time.strftime('%H:%M')} #{compromise.description}"
      end
      aconferece << ''
    end

    aconferece.join("\n")
  end

  def to_complete_s
    aconferece = []
    tracks.each  do |track|
      aconferece << track.name
      track.compromises.each do |compromise|
        aconferece << "Inicio: #{compromise.start_time.strftime('%d/%m/%y %H:%M')}"
        aconferece << "Fim: #{compromise.end_time.strftime('%d/%m/%Y %H:%M')}"
        aconferece << "#{compromise.description}"
        aconferece << ''
      end
      aconferece << ''
      aconferece << ''
    end

    aconferece.join("\n")
  end

  def tasks_to_conference(task_collection)
    @tracks = []
    @task_collection = task_collection
    build_tracks
  end

  def save(another_path='', name_file = Time.now.to_i)
    BaseFile.save(self.to_complete_s, another_path, name_file)
  end

  def self.tasks_to_conference(task_collection)
    c = Conference.new
    c.tasks_to_conference(task_collection)
    c
  end

  def self.tasks_to_conference(task_collection)
    c = Conference.new
    c.tasks_to_conference(task_collection)
    c
  end

  def self.delete_all(another_path='')
    BaseFile.remove_all(another_path)
  end

  def self.read_all_confereces(another_path='')
    BaseFile.read_all(another_path)
  end

  private

  def build_tracks(index=1)
    if @task_collection.size > 0
      compromises_first_time = build_compromises_first_time
      compromises_second_time = build_compromises_second_time
      compromises = compromises_first_time | compromises_second_time

      @tracks << Track.new("Track #{index}", compromises)
      build_tracks(index + 1)
    end
  end

  def build_compromises_first_time
    build_compromises(START_FIRST_TIME, TIME_TO_LANCH)
  end

  def build_compromises_second_time
    build_compromises(START_SECOND_TIME, END_TIME)
  end

  def build_compromises(start_time, end_time)
    @time_day = start_time

    compromises = []
    tasks_unallocated = []

    @task_collection.each do |task|
      next if task.min == 0 # next if don't have minutes on task
      time = @time_day + task.min.to_minutes # some for next compromise

      if time >= end_time
        tasks_unallocated << task
        next
      end

      compromise = Compromise.new
      compromise.start_time = @time_day
      compromise.end_time = time
      compromise.description = task.description
      compromises << compromise

      @time_day = time
    end

    dif_hours = end_time - @time_day # difference between rest of my time
    if dif_hours > 0
      task = first_task_with_no_minute
      if task
        compromise = Compromise.new
        compromise.start_time = @time_day
        compromise.end_time = end_time
        compromise.description = task.description
        compromises << compromise

        @time_day = end_time
        tasks_unallocated.delete_if{|t| t.min==task.min && t.description==task.description }
      end
    end

    @task_collection = tasks_unallocated

    compromises
  end

  def first_task_with_no_minute
    @task_collection.each do |task|
      return task if task.min == 0 # catch task if no minute
    end
    nil
  end
end