require 'spec_helper'

describe GlobalController do

  describe "GET 'auth'" do
    it "should be successful" do
      get 'auth'
      response.should be_success
    end
  end

end
