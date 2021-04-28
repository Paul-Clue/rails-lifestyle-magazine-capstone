require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:votes) }
  it { should have_many(:articles) }
end

RSpec.describe Article, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:votes) }
end

RSpec.describe Vote, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:article) }
end

RSpec.describe User, type: :model do
  context 'it checks the User model' do
    it 'checks if the user is created' do
      User.create(user_name: 'Benny')
      expect(User.count).to eq 1
    end
  end
end

RSpec.describe Category, type: :model do
  context 'it checks the cagegory model' do
    it 'tests if a new category object is created' do
      Category.create(name: 'tesla', priority: 1)
      expect(Category.count).to eq 1
    end
  end
end

RSpec.describe Vote, type: :model do
  it 'checks if a vote gets created' do
    use = User.create(user_name: 'Benny')
    cat = Category.create(name: 'tesla', priority: 1)
    art = Article.create(title: 'GM Article', text: 'Some News about Gm', image: 'pic', user_id: use.id,
                         category_id: cat.id)
    Vote.create(user_id: use.id, article_id: art.id)
    expect(Vote.count).to eq 1
  end
end

RSpec.describe Article, type: :model do
  it 'checks for the creation of an article' do
    use = User.create(user_name: 'Benny')
    cat = Category.create(name: 'tesla', priority: 1)
    Article.create(title: 'GM Article', text: 'Some News about Gm', image: 'pic', user_id: use.id, category_id: cat.id)
    expect(Article.count).to eq 1
  end
end
# RSpec.describe 'Sign in test', type: :feature do
#   it 'checks that a new account can be made successfully' do
#     visit root_path
#     within('.new_user') do
#       fill_in 'user_user_name', with: 'Chris'
#     end
#     click_button 'Create User'
#     expect(User.count).to eq 2
#   end
# end

# RSpec.describe 'Sign in test', type: :feature do
#   it 'checks that a new account holer can sign back in successfully' do
#     visit new_user_path
#     within('.new_user') do
#       fill_in 'user_user_name', with: 'Chris'
#     end
#     click_button 'Create User'
#     expect(User.count).to eq 1

#     visit root_path
#     within('.nav') do
#       click_link 'Sign out'
#     end

#     visit new_user_session_path
#     within('.new_user') do
#       fill_in 'Email', with: 'carlos@gmail.com'
#       fill_in 'Password', with: '123456'
#     end
#     click_button 'Log in'
#     expect(current_path).to eq('/')
#   end
# end
