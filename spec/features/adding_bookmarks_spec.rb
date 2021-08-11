feature "adding a bookmark" do
  scenario "a user can add a bookmark to bookmark manager" do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.danyaal.art')
    click_button 'add'

    expect(page).to have_content "https://www.danyaal.art"
  end
end