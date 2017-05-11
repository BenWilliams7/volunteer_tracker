class Volunteer

  attr_reader(:nombre, :project_id, :id)

  define_method(:initialize) do |attributes|
    @nombre = attributes.fetch(:nombre)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      nombre = volunteer.fetch('nombre')
      project_id = volunteer.fetch('project_id').to_i
      id = volunteer.fetch('id').to_i
      volunteers.push(Volunteer.new({:nombre => nombre, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO volunteers (nombre, project_id) VALUES ('#{@nombre}', #{@project_id}) RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  define_method(:==) do |another_volunteer|
    self.nombre.==(another_volunteer.nombre).&(self.project_id.==(another_volunteer.project_id))
  end


  define_singleton_method(:find) do |id|
    found_volunteer = nil
    Volunteer.all.each do |volunteer|
      if volunteer.id == id
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end

  def update(attributes)
    @nombre = attributes[:nombre]
    DB.exec("UPDATE volunteers SET nombre = '#{@nombre}' WHERE id = #{self.id};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id};")
  end
end
