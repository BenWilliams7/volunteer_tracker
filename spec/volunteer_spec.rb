require("rspec")
require("pg")
require("volunteer")

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM volunteer *;")
  end
end

describe(Volunteer) do
  describe("#==") do
    it("is the same volunteer if it has the same name") do
      name1 = Volunteer.new({:name => "George"})
      name2 = Volunteer.new({:name => "George"})
      expect(name1).to(eq(name2))
    end
  end
end
