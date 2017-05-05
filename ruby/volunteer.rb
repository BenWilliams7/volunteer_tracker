class Volunteer

  attr_reader(:name, :project_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_method(:==) do |another_volunteer|
   self.name().==(another_volunteer.name())
 end

end
