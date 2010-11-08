require 'spec_helper'

describe "quizzes/index.html.haml" do
  before(:each) do
    assign(:quizzes, [
      stub_model(Quiz,
        :question => "MyText",
        :answer => "Answer",
        :ruby_version => "Ruby Version"
      ),
      stub_model(Quiz,
        :question => "MyText",
        :answer => "Answer",
        :ruby_version => "Ruby Version"
      )
    ])
  end

  it "renders a list of quizzes" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "article>p", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "article>p", :text => "Ruby Version".to_s, :count => 2
  end
end
