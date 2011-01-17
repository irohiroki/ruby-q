require 'spec_helper'

describe Users::OmniauthCallbacksController do
  describe 'GET twitter' do
    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      request.env['omniauth.auth'] = {
        'provider' => 'twitter',
        'uid' => '123',
        'user_info' => {
          'name' => 'Hiroki'
        }
      }
      @user = mock_model(User).as_null_object
    end

    it 'signs in' do
      @auth = mock_model(Authentication).as_null_object.tap {|a|
        a.stub(:user => @user)
      }
      Authentication.should_receive(:find_or_initialize_by_provider_and_uid).with('twitter', '123').and_return(@auth)

      get :twitter
      warden.authenticated?(:user)
      response.should redirect_to(root_path)
    end

    it 'registers a new user' do
      @auth = mock_model(Authentication).as_new_record.tap {|a|
        a.should_receive(:build_user).with(:name => 'Hiroki')
        a.should_receive(:save).and_return(true)
        a.stub(:user => @user)
      }
      Authentication.should_receive(:find_or_initialize_by_provider_and_uid).with('twitter', '123').and_return(@auth)

      get :twitter
      warden.authenticated?(:user)
      response.should redirect_to(root_path)
    end

    it 'does not sign in on database error' do
      @auth = mock_model(Authentication).as_new_record.tap {|a|
        a.stub(:build_user => nil, :save => false)
      }
      Authentication.stub(:find_or_initialize_by_provider_and_uid => @auth)

      get :twitter
      flash[:alert].should eq('Could not sign you in because of a database error. Please try later.')
      warden.authenticated?(:user).should_not be
      response.should redirect_to(root_path)
    end
  end
end
