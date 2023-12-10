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
      include FormOptionsHelper
      include ActionView::Helpers::Tags::SelectRenderer if defined?(ActionView::Helpers::Tags::SelectRenderer)
    end
  end
end
