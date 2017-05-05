class Volunteer

  attr_reader(:nombre, :project_id)

  define_method(:initialize) do |attributes|
    @nombre = attributes.fetch(:nombre)
    @project_id = attributes.fetch(:project_id)
  end

  define_singleton_method(:all) do
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      nombre = volunteer.fetch('nombre')
      project_id = volunteer.fetch('project_id').to_i
      volunteers.push(Volunteer.new({:nombre => nombre, :project_id => project_id}))
    end
    volunteers
  end

  define_method(:save) do
    DB.exec("INSERT INTO volunteers (nombre, project_id) VALUES ('#{@nombre}', #{@project_id});")
  end

  define_method(:==) do |another_task|
    self.nombre.==(another_task.nombre).&(self.project_id.==(another_task.project_id))
  end
end
