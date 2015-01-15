# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :surf_server, :class => 'Surf::Server' do
    name "MyString"
    ip "MyString"
  end
end
