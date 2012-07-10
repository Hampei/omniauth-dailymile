require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class DailyMile < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.dailymile.com',
        :authorize_url => 'https://api.dailymile.com/oauth/authorize',
        :token_url => 'https://api.dailymile.com/oauth/token'
      }

      def request_phase
        super
      end

      uid { raw_info['username'] }

      info do
        {
          'nickname' => raw_info['username'],
          'name' => raw_info['display_name'],
          'image' => raw_info['photo_url'],
          'urls' => {
            'DailyMile' => raw_info['url']
          },
          'timezone' => raw_info['time_zone']
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        # set these here instead of using 'option token_params' since omniauth-oath2 is passing those incorrectly
        access_token.options[:param_name] = 'oauth_token'
        access_token.options[:mode] = :query
        @raw_info = JSON.parse access_token.get('/people/me.json').body
      end
    end
  end
end

OmniAuth.config.add_camelization 'dailymile', 'DailyMile'
