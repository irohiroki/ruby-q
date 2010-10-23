require 'spec_helper'

describe "quizzes/show.html.haml" do
  before(:each) do
    @quiz = assign(:quiz, stub_model(Quiz,
      :question => "MyText",
      :answer => "Answer",
      :ruby_version => "Ruby Version"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Answer/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Ruby Version/)
  end
end
