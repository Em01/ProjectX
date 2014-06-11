Given(/^I want to sell some stuff$/) do
  visit '/'
  click_on '+'
end

Then(/^I should be able to post a listing$/) do
	expect(current_path).to eq '/listings/new'
  fill_in 'Description', with: 'Test'
  attach_file('listing-picture',Rails.root.join('images/product_image.jpg'))
  click_on 'Add my stuff'
  expect(current_path).to eq '/'
  expect(page).to have_content 'Test'
end

Then(/^I can see a picture$/) do
  expect(page).to have_css('img.listing-picture')
end




