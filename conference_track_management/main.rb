Dir["#{File.expand_path('../app/*/', __FILE__)}/*.rb"].each {|file| require file }

def save_and_show_conference(task_collection)
  conference = Conference.tasks_to_conference(task_collection)
  conference.save
  puts "\n============== Sua conferência ===================\n"
  puts conference
  puts "\n==================================================\n"
end

def read_all_confereces
  puts Conference.read_all_confereces
end

def create_task_collection
  task_collection = []
  while(1==1) do
    puts 'Digite sua atividade'
    stask = gets
    task = StringToTask.parse(stask)
    task_collection << task

    puts "\nCansou de digitar atividades? quer parar ? digite 1\n"
    exit = gets

    if exit.strip == "1"
      save_and_show_conference(task_collection)
      break 
    end
  end
end


puts '======== Gestão de conferências ========='
while(1==1) do
  puts "\nOlá amigo o que deseja fazer agora?\n1) Criar nova confência\n2) Ver conferências anteriores\n3) Me tira daqui\n"

  desire = gets.to_i

  if desire == 1
    create_task_collection
  elsif desire == 2
    read_all_confereces
  else
    break
  end
end