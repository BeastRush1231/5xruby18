require 'rails_helper'

RSpec.describe Todotask, type: :model do
  describe "建立 Todotask" do 
    it "新增 Todotask" do 
      todotask = Todotask.new
        expect(todotask).to be_a Todotask
    end
  end

  describe "建立 Todotask 任務跟內容" do 
    it "Todotask 任務內容" do 
      todotask = Todotask.new
      todotask.name = "task"
      todotask.content = "do task"
        expect(todotask.name).to eq "task"
        expect(todotask.content).to eq "do task"
    end
  end
end 