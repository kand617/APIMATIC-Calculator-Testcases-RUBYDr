# This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ).

module ApimaticCalculatorTestcases
  class SimpleCalculatorController < BaseController
    @@instance = SimpleCalculatorController.new
    # Singleton instance of the controller class
    def self.instance
      @@instance
    end

    # Calculates the expression using the specified operation.
    # @param [String] operation Required parameter: The operator to apply on the variables
    # @param [Float] x Required parameter: The LHS value
    # @param [Float] y Required parameter: The RHS value
    # @return String response from the API call
    def get_calculate(options = Hash.new)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/{operation}'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'operation' => options['operation']
      }

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'x' => options['x'],
        'y' => options['y']
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.get _query_url, headers: _headers, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 404
        return nil
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      return _response.raw_body
    end
  end
end
