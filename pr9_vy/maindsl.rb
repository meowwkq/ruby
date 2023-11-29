class Task
    attr_accessor :title, :description, :status
  
    def initialize(title, description)
      @title = title
      @description = description
      @status = :in_progress 
    end
  
    def mark_as_done
      @status = :done 
    end
  
    def to_s
      "#{title} - #{description} (Status: #{status})"
    end
  end
  
  class Project
    def initialize
      @tasks = []
    end
  
    # Метод для додавання нового завдання до проекту
    def task(title, description, &block)
      new_task = Task.new(title, description)
      new_task.instance_eval(&block) if block_given? 
      @tasks << new_task
    end
  
    # Метод для виведення списку завдань проекту
    def list_tasks
      @tasks.each { |task| puts task }
    end
  end
  
  project = Project.new
  
  # завдання з вказанням статусу виконаного
  project.task "Implement feature X", "Add functionality for X" do
    mark_as_done
  end
  
  # завдання без вказання статусу
  project.task "Refactor code", "Clean up the existing codebase"
  
  # список завдань
  project.list_tasks
  