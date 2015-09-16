require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to :user }
  it { should have_many :answers }

  it { should have_valid(:title).when('question') }
  it { should_not have_valid(:title).when('', nil) }

  it { should have_valid(:body).when('question') }
  it { should_not have_valid(:body).when('', nil) }

end
