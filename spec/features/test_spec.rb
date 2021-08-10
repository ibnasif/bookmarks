feature "test" do
  scenario "say hello world" do
    visit '/test'
    expect(page).to have_content "hello world."
  end
end