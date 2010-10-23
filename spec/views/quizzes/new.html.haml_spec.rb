require 'spec_helper'

describe "quizzes/new.html.haml" do
  before(:each) do
    assign(:quiz, stub_model(Quiz,
      :question => "MyText",
      :answer => "MyString",
      :ruby_version => "MyString"
    ).as_new_record)
  end

  it "renders new quiz form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => quizzes_path, :method => "post" do
      assert_select "textarea#quiz_question", :name => "quiz[question]"
      assert_select "input#quiz_answer", :name => "quiz[answer]"
      assert_select "input#quiz_ruby_version", :name => "quiz[ruby_version]"
    end
  end
end
