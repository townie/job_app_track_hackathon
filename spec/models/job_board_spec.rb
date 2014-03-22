require 'spec_helper'

describe JobBoard do
  context 'validations' do
    let(:job_board) {JobBoard.new(title: "HIRE ME")}
    it 'is invalid without a title' do
      job_board.title = ""
      expect(job_board).to_not be_valid
      expect(job_board.errors[:title]).to_not be_blank
    end
  end
end
