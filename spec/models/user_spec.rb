require 'factory_bot'

RSpec.describe User, type: :model do
    describe "full name" do
 let(:user) { build(:user, first_name: "Alex")}

it "returns full name" do
    expect(user.first_name).to eql "Chris"
        end
    end
end