require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content /Sign up/i
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'Email', with: 'email@test.com'
      fill_in 'Password', with: 'TestPassword'
      click_on 'Sign up'
    end

    scenario 'shows email on a the homepage after signup' do
      expect(page).to have_content 'email@test.com'
    end
  end
end

feature 'logging in' do
  scenario 'shows email on the homepage after login' do
    visit new_user_url
    fill_in 'Email', with: 'email@test.com'
    fill_in 'Password', with: 'TestPassword'
    click_on 'Sign up'
    visit root_url

    expect(page).to have_content 'email@test.com'
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit root_url
    expect(page).to have_content 'Sign in'
  end

  scenario 'does not show username on the homepage after logout' do
    visit new_user_url
    fill_in 'Email', with: 'email@test.com'
    fill_in 'Password', with: 'TestPassword'
    click_on 'Sign up'
    click_on 'Logout'

    expect(page).not_to have_content 'email@test.com'
  end
end