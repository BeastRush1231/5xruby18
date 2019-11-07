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

  describe "建立 Todotask 任務&任務內容不能為空白" do 
    it "Todotask 不空白任務內容" do 
      todotask = Todotask.create(name: "",content: "")
        expect(todotask.errors.full_messages).to eq ["Name 不能為空白", "Content 不能為空白"]
    end
  end
end 