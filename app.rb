require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/volunteer")
require("./lib/project")
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get("/") do
  @projects = Project.all()
  @volunteers = Volunteer.all
  erb(:index)
end

post '/projects' do
  name = params.fetch('name')
  project = Project.new({:name => name, :id => nil})
  project.save
  @projects = Project.all()
  @volunteers = Volunteer.all
  erb :index
end

post '/volunteers' do
  nombre = params.fetch('nombre')
  project_id = params.fetch('project_id').to_i
  @project = Project.find(project_id)
  volunteer = Volunteer.new({:nombre => nombre, :id => nil, :project_id => project_id}).save()
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

get '/projects/:id' do
  @project = Project.find(params.fetch('id').to_i)
  @projects = Project.all()
  erb :project
end

get("/projects/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

patch("/projects/:id") do
  name = params.fetch("name")
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:name => name})
  erb(:project)
end

delete("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  @volunteers = Volunteer.all
  erb(:index)
end

get "/volunteers/:id" do
  @volunteer = Volunteer.find(params.fetch('id').to_i)
  @volunteers = Volunteer.all
  erb(:volunteer)
end

get '/volunteers/:id/edit' do
  @volunteer = Volunteer.find(params.fetch('id').to_i)
  @volunteers = Volunteer.all
  erb :volunteer_edit
end

patch("/volunteers/:id") do
  nombre = params.fetch("nombre")
  id = params.fetch('id').to_i
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  @volunteer.update({:nombre => nombre})
  @volunteers = Volunteer.all
  erb :volunteer
end

delete("/volunteers/:id") do
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  @volunteer.delete()
  @volunteers = Volunteer.all()
  @projects = Project.all()
  erb :index
end
