require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :questions }
  it { should have_many :answers }

  it { should have_valid(:username).when('user', 'name') }
  it { should_not have_valid(:username).when('', nil) }
end
