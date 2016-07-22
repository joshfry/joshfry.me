---
title: Ruby on Rails - Respond to JSON Only
description: You might have a Rails controller that is only meant to respond to JSON requests.
---

> You might have a Rails controller that is only meant to respond to JSON requests.

I was integrating the FedEx API into a Rails app I'm working on for address validation. I created an `Addresses` controller with an action called `validate_address` which will query the FedEx API with an address and send back the results in JSON.

~~~ ruby
class AddressesController < ApplicationController

  def validate_address

    @api = FedexApi.new AppName::Application.config.fedex_config.symbolize_keys
    validated_address = @api.verify_address(params)
    
    respond_to do |format|
      format.json { render json: validated_address }
    end
  end

end
~~~

- In this case `/validate_address.json` will return JSON and everything works out great.
- `/validate_address` is accessible too, but it shouldn't be. There's nothing to show!

### Solution

- Create a `before_filter` to `check_format` of request
- `redirect_to root_url` unless the format is JSON

_Add to following to the top of your controller:_

~~~ ruby
# only accept json requests
before_filter :check_format

def check_format
  redirect_to root_url unless params[:format] == 'json' || request.headers["Accept"] =~ /json/
end
~~~



I can't take full credit for this. Thank you [Stack Overflow](http://stackoverflow.com/questions/14579774/respond-to-only-json-in-rails).