require 'spec_helper'

feature 'User browsing the website' do
  context "on homepage" do
    it "sees a list of recent posts titles" do
      post = Post.create(title: "bob", content: "A great story")
      visit '/'
      expect(page).to have_content("#{post.title}")
    end

    it "can click on titles of recent posts and should be on the post show page" do
      post = Post.create(title: "bob", content: "A great story")
      visit '/'
      click_link("#{post.title}")
      expect(page).to have_content("#{post.title}")
    end
  end

  context "post show page" do
    it "sees title and body of the post" do
      post = Post.create(title: "bob", content: "A great story")
      visit "/posts/#{post.id}"
      expect(page).to have_content("#{post.title}")
      expect(page).to have_content("#{post.content}")
    end
  end
end
