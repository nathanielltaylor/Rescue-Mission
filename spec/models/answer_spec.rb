require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to :user }
  it { should belong_to :question}

  it { should have_valid(:title).when('answer') }
  it { should_not have_valid(:title).when('', nil) }

  it { should have_valid(:body).when('answer') }
  it { should_not have_valid(:body).when('', nil) }

end
