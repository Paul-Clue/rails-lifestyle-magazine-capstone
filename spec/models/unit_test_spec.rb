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
