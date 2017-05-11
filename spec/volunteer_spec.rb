require("spec_helper")

describe(Volunteer) do
  describe(".all") do
     it('is empty at first') do
       expect(Volunteer.all()).to(eq([]))
     end
   end

   describe("#save") do
     it("adds a volunteer to the array of saved volunteers") do
       test_volunteer = Volunteer.new({:nombre => "George", :project_id => 1, :id => 1})
       test_volunteer.save()
       expect(Volunteer.all()).to(eq([test_volunteer]))
     end
   end

   describe("#nombre") do
     it("lets you give it a nombre") do
       test_volunteer = Volunteer.new({:nombre => "George", :project_id => 1, :id => 1})
       expect(test_volunteer.nombre()).to(eq("George"))
     end
   end

   describe("project_id") do
     it("lets you read the project ID out") do
       test_volunteer = Volunteer.new({:nombre => "George", :project_id => 1, :id => 1})
       expect(test_volunteer.project_id).to(eq(1))
     end
   end

   describe '#==' do
      it 'is the same volunteer if it has the same nombre and project ID' do
        volunteer1 = Volunteer.new({:nombre => 'Tommy', :project_id => 1, :id => 1})
        volunteer2 = Volunteer.new({:nombre => 'Tommy', :project_id => 1, :id => 1})
        expect(volunteer1).to(eq(volunteer2))
      end
    end
end
