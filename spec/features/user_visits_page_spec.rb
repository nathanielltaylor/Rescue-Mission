require 'rails_helper'

def setup
  $user = FactoryGirl.create(:user)
  question = FactoryGirl.create(:question, user: $user)
end

feature "User checks homepage", %(
  As a user
  I want to see the titles of previously submitted questions
  So that I can see if my question has already been asked
) do

  scenario "user visits root path" do
    setup
    visit "/"
    expect(page).to have_content("how to use rails")
    expect(page).to have_content("champ")
  end

  scenario "user clicks question" do
    setup
    FactoryGirl.create(:question, user: $user, title: "other question title")
    visit "/"
    click_link("how to use rails")
    expect(page).to have_content("how to use rails")
    expect(page).to have_content("how do i write code")
    expect(page).to_not have_content("other question title")
  end
end

feature "User messes with questions", %(
  As a user
  I want to be able to edit and delete my questions
  So that I can keep my page relevant
) do

  scenario "user deletes question" do
    setup
    visit "/"
    within ".table" do
      click_link("Delete", :match => :first)
    end
    expect(page).to_not have_content("how to use rails")
    expect(page).to_not have_content("champ")
  end

  scenario "user edits question" do
    setup
    visit "/"
    within ".table" do
      click_link("Edit", :match => :first)
    end
    fill_in('Title', :with => 'new title')
    fill_in('Body', :with => 'new body')
    click_button('Submit Edited Question')
    expect(page).to have_content("Question was successfully updated.")
    expect(page).to have_content('new title')
    expect(page).to have_content('new body')
    expect(page).to_not have_content("how to use rails")
    expect(page).to_not have_content("how do i write code")
  end
end

feature "User adds new content", %(
  As a user
  I want to be able to add new questions and answers
  So that I can help myself and others to learn
) do

  scenario "user submits new question" do
    setup
    visit "/"
    click_link("Ask a new question")
    fill_in('Title', :with => 'new title')
    fill_in('Body', :with => 'new body')
    click_button('Ask Question')
    expect(page).to have_content("Question was successfully created.")
    expect(page).to have_content('new title')
    expect(page).to have_content('new body')
  end

  scenario "user tries to submit blank question" do
    setup
    visit "/"
    click_link("Ask a new question")
    fill_in('Title', :with => ' ')
    fill_in('Body', :with => '    ')
    click_button('Ask Question')
    expect(page).to have_content("Please fill in both fields")
    expect(page).to_not have_content('new title')
    expect(page).to_not have_content('new body')
  end

  scenario "users navigates to and answers question" do
    setup
    visit "/"
    click_link("how to use rails")
    click_link("Submit an Answer")
    fill_in('Title', :with => 'new answer title')
    fill_in('Body', :with => 'new answer body')
    click_button('Submit')
    expect(page).to have_content("Answer was successfully submitted.")
    expect(page).to have_content('new answer title')
    expect(page).to have_content('new answer body')
  end

  scenario "user tries to submit blank answer" do
    setup
    visit "/"
    click_link("how to use rails")
    click_link("Submit an Answer")
    fill_in('Title', :with => '    ')
    fill_in('Body', :with => ' ')
    click_button('Submit')
    expect(page).to have_content("Please fill out both fields")
    expect(page).to_not have_content('new answer title')
    expect(page).to_not have_content('new answer body')
  end
end
