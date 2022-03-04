# frozen_string_literal: true

require 'to_currency_select_tag'

# CurrencySelect
module ActionView
  module Helpers
    ##
    # Tag.
    #
    class CurrencySelectTag < Tags::Base
      include ToCurrencySelectTag
    end
  end
end
