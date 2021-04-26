require 'rails_helper'

RSpec.describe 'articles/edit', type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
                                  title: 'MyString',
                                  story: 'MyText',
                                  image: '',
                                  user: nil
                                ))
  end

  it 'renders the edit article form' do
    render

    assert_select 'form[action=?][method=?]', article_path(@article), 'post' do
      assert_select 'input[name=?]', 'article[title]'

      assert_select 'textarea[name=?]', 'article[story]'

      assert_select 'input[name=?]', 'article[image]'

      assert_select 'input[name=?]', 'article[user_id]'
    end
  end
end
