require 'spec_helper'
require 'webmock/rspec'

describe "SignIns" do
  describe "with Twitter" do
    it "redirects to Twitter and calls back" do
      stub_request(:post, "https://api.twitter.com/oauth/request_token").to_return(:status => 200, :body => 'oauth_token=t9zvi1zgCsCkJHmAmPAsYqm47A0RxQX1Mix17xXXXX&oauth_token_secret=GbLzmL41coV6oBQgGJPURqNGAxpEjR2tEM9AXXXX&oauth_callback_confirmed=true', :headers => {})
      stub_request(:post, "https://api.twitter.com/oauth/access_token").to_return(:status => 200, :body => 'oauth_token=12345-Jxq8aYUDRmykzVKrgoLhXSq67TEa5ruc4GJC2rXXXX&oauth_token_secret=J6zix3FfA9LofH0awS24M3HcBYXO5nI1iYe8XXXX&user_id=12345&screen_name=johns', :headers => {})
      stub_request(:get, "https://api.twitter.com/1/account/verify_credentials.json").to_return(:status => 200, :body => '{"screen_name": "johns", "name": "John Smith", "location": "Tokyo", "profile_image_url": "", "description": "", "url": ""}', :headers => {})

      visit '/'
      click_link 'Sign in with Twitter'
      redirect?
      get_via_redirect "/users/auth/twitter/callback?#{response.location[/(?<=\?).*/]}&oauth_verifier=pDNg57prOHapMbhv25RNf75lVRd6JDsni1AJJIDYoTY"
      response.should contain("Signed in as: John Smith")
    end
  end
end
