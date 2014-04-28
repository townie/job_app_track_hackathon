require 'spec_helper'

describe Post do
  context 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:status) }
    it { should belong_to(:user) }
    it { should belong_to(:job_board) }
    it { should validate_uniqueness_of(:job_posting_url) }
  end
end
