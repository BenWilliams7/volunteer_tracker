
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'seeing details for a single project', {:type => :feature} do
  it 'allows a user to click a project to see the projects and details for it' do
    project = Project.new({:name => "Project Red Herring", :id => nil})
    project.save
    volunteer = Volunteer.new({:nombre => "Slippy Sloap", :project_id => project.id})
    volunteer.save
    visit '/'
    click_link(project.name)
    expect(page).to have_content(volunteer.nombre)
  end
end
