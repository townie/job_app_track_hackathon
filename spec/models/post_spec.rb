require 'spec_helper'

describe Post do
  context 'Validations' do
    let(:post) {Post.new(title: "Nurse Admin III", status: "Active")}
    it 'is invalid without a title' do
      post.title = ""
      expect(post).to_not be_valid
      expect(post.errors[:title]).to_not be_blank
    end

    it 'must have a user' do
      user = User.create(name: "Anthony", email: "anthony@ross.com")
      post.user_id = user.id
      expect(post.user).to_not be_blank
    end

    it 'must have a status' do
      post.status = ""
      expect(post).to_not be_valid
      expect(post.errors[:status]).to_not be_blank
    end
    it 'must be part of a job board' do
      board = JobBoard.create(title: "HIRE ME")
      post.job_board_id = board.id
      post.save
      expect(post.job_board.title).to_not be_blank
    end
  end



end
