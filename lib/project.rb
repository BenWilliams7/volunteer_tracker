
class Project
  attr_reader(:name, :id)
    define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @id = attributes.fetch(:id)
    end

    def Project.all
      returned_projects = DB.exec("SELECT * FROM projects;")
      projects = []
      returned_projects.each() do |project|
        name = project.fetch('name')
        id = project.fetch('id').to_i
        projects.push(Project.new({:name => name, :id => id}))
      end
      projects
    end

    def save
      result = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}') RETURNING id;")
      @id = result.first().fetch("id").to_i()
    end

    define_method(:==) do |another_project|
      self.name().==(another_project.name()).&(self.id().==(another_project.id()))
    end

    define_singleton_method(:find) do |id|
      found_project = nil
      Project.all.each do |project|
        if project.id.==(id)
          found_project = project
        end
      end
      found_project
    end

    define_method(:volunteers) do
      project_volunteers = []
      volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id};")
      volunteers.each do |volunteer|
        description = volunteer.fetch('name')
        project_id = volunteer.fetch('project_id').to_i
        project_volunteers.push(Volunteer.new({:description => description, :project_id => project_id}))
      end
      project_volunteers
    end

    define_method(:update) do |attributes|
      @name = attributes.fetch(:name)
      @id = self.id()
      DB.exec("UPDATE projects SET name = '#{@name}' WHERE id = #{@id};")
    end

    define_method(:delete) do
      DB.exec("DELETE FROM projects WHERE id = #{self.id()};")
      DB.exec("DELETE FROM volunteers WHERE project_id = #{self.id()};")
    end
  end
