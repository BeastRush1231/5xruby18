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

  scenario "任務列表以結束時間(end_time)排序" do
    FactoryBot.create(:todotask, name: "todotasks1")
    FactoryBot.create(:todotask, name: "todotasks2", end_time: "2019-10-26 19:18:18 +0800")
    visit root_path
    within 'tbody tr:nth-child(1)' do
      expect(page).to have_content("todotasks2")
    end
    within 'tbody tr:nth-child(2)' do
      expect(page).to have_content("todotasks1")
    end
  end

  let(:todotask1) { FactoryBot.create(:todotask, end_time: Time.now.yesterday) }
  let(:todotask2) { FactoryBot.create(:todotask, end_time: Time.now) }

  scenario "建立2個任務後 更改狀態" do
    todotask1
    todotask2

    visit edit_todotask_url(todotask1.id)
    select 'processing', from: 'todotask_status'
    click_on "送出"
    visit todotasks_path

    expect(todotask1.reload.status).to eq "processing"
    expect(todotask2.status).to eq "upcoming"
    expect(find('table tbody tr:nth-child(1) td:nth-child(5)')).to have_content("processing")
    expect(find('table tbody tr:nth-child(2) td:nth-child(5)')).to have_content("upcoming")
  end
end