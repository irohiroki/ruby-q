require "spec_helper"

describe QuizzesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/quizzes" }.should route_to(:controller => "quizzes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/quizzes/new" }.should route_to(:controller => "quizzes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/quizzes/1" }.should route_to(:controller => "quizzes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/quizzes/1/edit" }.should route_to(:controller => "quizzes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/quizzes" }.should route_to(:controller => "quizzes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/quizzes/1" }.should route_to(:controller => "quizzes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/quizzes/1" }.should route_to(:controller => "quizzes", :action => "destroy", :id => "1")
    end

  end
end
