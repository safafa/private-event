require 'rails_helper'
describe 'the signout process', type: :feature do
  before :each do
    User.create(email: 'safa@gmail.com', password: '123456', username: 'safa')
  end
  it 'Log out the user' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'safa@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'LogOut'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Signed out successfully.')
  end
end
