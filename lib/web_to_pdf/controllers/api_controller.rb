# This file was automatically generated for Expedited Addons by APIMATIC v2.0 ( https://apimatic.io ) on 06/03/2016

module WebToPdf
  class APIController < BaseController
    @@instance = APIController.new
    # Singleton instance of the controller class
    def self.instance
      @@instance
    end

    # TODO: type endpoint description here
    # @param [String] content Required parameter: The HTML content. This can be either a URL to load HTML from or an actual HTML content string
    # @param [Integer] margin Required parameter: The PDF document margin (in mm)
    # @param [Integer] html_width Required parameter: The width (in px) to render the HTML document at
    # @param [String] title Required parameter: The PDF document title
    # @return Mixed response from the API call
    def lookup(content, 
               margin, 
               html_width, 
               title)

      # Validate required parameters
      if content == nil
        raise ArgumentError.new "Required parameter 'content' cannot be nil."
      elsif margin == nil
        raise ArgumentError.new "Required parameter 'margin' cannot be nil."
      elsif html_width == nil
        raise ArgumentError.new "Required parameter 'html_width' cannot be nil."
      elsif title == nil
        raise ArgumentError.new "Required parameter 'title' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'content' => content,
        'margin' => margin,
        'html_width' => html_width,
        'title' => title,
        'api_key' => Configuration.api_key
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json'
      }

      # invoke the API call request to fetch the response
      _response = Unirest.get _query_url, headers: _headers

      # Endpoint error handling using HTTP status codes.
      if _response.code == 404
        return nil
      end

      # Global error handling using HTTP status codes.
      validate_response(_response)

      # Return appropriate type
      _response.body.dup
    end
  end
end
