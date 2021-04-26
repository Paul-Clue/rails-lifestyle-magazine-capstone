require 'rails_helper'

# RSpec.describe Link, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe User, type: :model do
  it { should have_many(:votes) }
  it { should have_many(:articles) }
end

RSpec.describe Article, type: :model do
  it { should belong_to(:user) }
  it { should have_one_attached(:image) }
  it { should have_many(:votes) }
end

RSpec.describe Vote, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:article) }
end

RSpec.describe User, type: :model do
  context 'it checks the model' do
    it 'checks if the user is created' do
      User.create(user_name: 'Benny')
      expect(User.count).to eq 1
    end
  end
end

RSpec.describe Vote, type: :model do
  context 'it checks the model' do
    it 'checks if the vote belongs to the article' do
      Vote.reflect_on_association(:article)
      expect(vote.macro).to eql(:belongs_to)
    end

    it 'checks if the vote is created' do
      User.create(user_name: 'Benny')
      Category.create(name: 'tesla', priority: 1)
      art = Article.create(title: 'GM Article', text: 'Some News about Gm', user_id: 1, category_id: 1)
      art.image.attach(io: File.open('C:/Users/paulc/Downloads/gm-pic.png'), filename: 'gm-pic.png')
      Vote.create(user_id: 1, article_id: nil)
      expect(Vote.count).to eq 0
    end
  end
end
