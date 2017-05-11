
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'seeing details for a single project', {:type => :feature} do
  it 'allows a user to click a project to see the projects and details for it' do
    project = Project.new({:name => "Project Red Herring", :id => 1})
    project.save
    visit '/'
    click_link(project.name)
    expect(page).to have_content(project.name)
  end
end

describe('adding volunteers to a project', {:type => :feature}) do
  it('allows a user to add a volunteer to a project') do
    project = Project.new({:name => 'Avoid the Apocalypse', :id => 1})
    project.save
    visit('/')
    select('Avoid the Apocalypse', from: 'project_id')
    fill_in('nombre', {with: 'Darth'})
    click_button('Add')
    expect(page).to have_content('Darth')
  end
end
