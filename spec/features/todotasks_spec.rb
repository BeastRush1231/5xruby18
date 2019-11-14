require 'rails_helper'

RSpec.feature "Todotasks", type: :feature do

  before do
    FactoryBot.create(:user)
  end

  scenario "建立新的任務" do
    visit root_path
    click_on "新增任務"
    fill_in('標題', with: "todotasks1")
    fill_in('內容', with: "content1")
    click_on "送出"

    expect(page).to have_content "todotasks1"
    expect(page).to have_content "content1"
    expect(page).to have_content "新增任務成功"
  end

  scenario "編輯任務" do
    FactoryBot.create(:todotask, name: "todotasks1")
    visit root_path
    click_on "編輯"
    fill_in('標題', with: "todotasks2")
    fill_in('內容', with: "content2")
    click_on "送出"

    expect(page).to have_content "todotasks2"
    expect(page).to have_content "content2"
    expect(page).to have_content "編輯任務成功"
  end

  scenario "刪除任務" do
    FactoryBot.create(:todotask, name: "todotasks1")
    visit root_path
    click_on "刪除"
    expect(page).not_to have_content("todotasks1")
    expect(Todotask.count).to be(0)
  end

  scenario "任務列表以建立時間排序" do
    FactoryBot.create(:todotask, name: "todotasks1")
    FactoryBot.create(:todotask, name: "todotasks2")
    visit root_path
    within 'tbody tr:nth-child(1)' do
      expect(page).to have_content("todotasks2")
    end
    within 'tbody tr:nth-child(2)' do
      expect(page).to have_content("todotasks1")
    end
  end
end