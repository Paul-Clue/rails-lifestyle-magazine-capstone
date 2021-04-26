require 'rails_helper'

RSpec.describe 'articles/new', type: :view do
  before(:each) do
    assign(:article, Article.new(
                       title: 'MyString',
                       story: 'MyText',
                       image: '',
                       user: nil
                     ))
  end

  it 'renders new article form' do
    render

    assert_select 'form[action=?][method=?]', articles_path, 'post' do
      assert_select 'input[name=?]', 'article[title]'

      assert_select 'textarea[name=?]', 'article[story]'

      assert_select 'input[name=?]', 'article[image]'

      assert_select 'input[name=?]', 'article[user_id]'
    end
  end
end
