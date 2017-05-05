
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new project', {:type => :feature})  do
  it 'allows a user to click a project to see the projects and details for it' do
    visit '/'
    fill_in 'name', :with => 'Epicodus Work'
  end
end

describe 'seeing details for a single project', {:type => :feature} do
  it 'allows a user to click a project to see the projects and details for it' do
    test_project = Project.new({:name => "School stuff", :id => nil})
    test_project.save
    test_project = Volunteer.new({:nombre => "learn SQL", :project_id => test_project.id})
    test_project.save
    visit '/'
    click_link(test_project.name)
    expect(page).to have_content(test_project.nombre)
  end
end
