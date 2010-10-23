require 'spec_helper'

describe "quizzes/edit.html.haml" do
  before(:each) do
    @quiz = assign(:quiz, stub_model(Quiz,
      :new_record? => false,
      :question => "MyText",
      :answer => "MyString",
      :ruby_version => "MyString"
    ))
  end

  it "renders the edit quiz form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => quiz_path(@quiz), :method => "post" do
      assert_select "textarea#quiz_question", :name => "quiz[question]"
      assert_select "input#quiz_answer", :name => "quiz[answer]"
      assert_select "input#quiz_ruby_version", :name => "quiz[ruby_version]"
    end
  end
end
