require 'rails_helper'
describe 'the signin process', type: :feature do
  before :each do
    User.create(email: 'safa@gmail.com', password: '123456', username: 'safa')
  end
  it 'signs @user in' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'safa@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Signed in successfully.')
  end

  it 'Should not signs @user in if not valid' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'detola@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_text('Invalid Email or password.')
  end
end
