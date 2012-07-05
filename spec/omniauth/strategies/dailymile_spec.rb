require 'spec_helper'

describe OmniAuth::Strategies::DailyMile do
  subject do
    OmniAuth::Strategies::DailyMile.new({})
  end

  context "client options" do
    it 'should have correct site' do
      subject.options.client_options.site.should eq("https://api.dailymile.com")
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://api.dailymile.com/oauth/authorize')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('https://api.dailymile.com/oauth/token')
    end
  end
end
