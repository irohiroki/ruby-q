require 'spec_helper'

describe QuizzesController do

  def mock_quiz(stubs={})
    (@mock_quiz ||= mock_model(Quiz).as_null_object).tap do |quiz|
      quiz.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all quizzes as @quizzes" do
      Quiz.stub(:all) { [mock_quiz] }
      get :index
      assigns(:quizzes).should eq([mock_quiz])
    end
  end

  describe "GET show" do
    it "assigns the requested quiz as @quiz" do
      Quiz.stub(:find).with("37") { mock_quiz }
      get :show, :id => "37"
      assigns(:quiz).should be(mock_quiz)
    end
  end

  describe "GET new" do
    it "assigns a new quiz as @quiz" do
      Quiz.stub(:new) { mock_quiz }
      get :new
      assigns(:quiz).should be(mock_quiz)
    end
  end

  describe "GET edit" do
    it "assigns the requested quiz as @quiz" do
      Quiz.stub(:find).with("37") { mock_quiz }
      get :edit, :id => "37"
      assigns(:quiz).should be(mock_quiz)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created quiz as @quiz" do
        Quiz.stub(:new).with({'these' => 'params'}) { mock_quiz(:save => true) }
        post :create, :quiz => {'these' => 'params'}
        assigns(:quiz).should be(mock_quiz)
      end

      it "redirects to the created quiz" do
        Quiz.stub(:new) { mock_quiz(:save => true) }
        post :create, :quiz => {}
        response.should redirect_to(quiz_url(mock_quiz))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved quiz as @quiz" do
        Quiz.stub(:new).with({'these' => 'params'}) { mock_quiz(:save => false) }
        post :create, :quiz => {'these' => 'params'}
        assigns(:quiz).should be(mock_quiz)
      end

      it "re-renders the 'new' template" do
        Quiz.stub(:new) { mock_quiz(:save => false) }
        post :create, :quiz => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested quiz" do
        Quiz.should_receive(:find).with("37") { mock_quiz }
        mock_quiz.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :quiz => {'these' => 'params'}
      end

      it "assigns the requested quiz as @quiz" do
        Quiz.stub(:find) { mock_quiz(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:quiz).should be(mock_quiz)
      end

      it "redirects to the quiz" do
        Quiz.stub(:find) { mock_quiz(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(quiz_url(mock_quiz))
      end
    end

    describe "with invalid params" do
      it "assigns the quiz as @quiz" do
        Quiz.stub(:find) { mock_quiz(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:quiz).should be(mock_quiz)
      end

      it "re-renders the 'edit' template" do
        Quiz.stub(:find) { mock_quiz(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested quiz" do
      Quiz.should_receive(:find).with("37") { mock_quiz }
      mock_quiz.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the quizzes list" do
      Quiz.stub(:find) { mock_quiz }
      delete :destroy, :id => "1"
      response.should redirect_to(quizzes_url)
    end
  end

end
