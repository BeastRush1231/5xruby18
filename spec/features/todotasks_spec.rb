require 'rails_helper'

RSpec.feature "Todotasks", type: :feature do
  scenario "建立新的任務" do

    visit todotasks_path

    click_on "新增任務"
    fill_in('姓名', with: "todotasks' name")
    fill_in('內容', with: "content")
    click_on "Create Todotask"

    expect(page).to have_content "todotasks' name"
    expect(page).to have_content "content"
    expect(page).to have_content "新增任務成功"
  end
end