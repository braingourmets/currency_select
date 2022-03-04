# frozen_string_literal: true

# CurrencySelect
module ActionView
  module Helpers
    ##
    # Form builder.
    #
    class FormBuilder
      def currency_select(
        method, priority_currencies = nil, options = {}, html_options = {}
      )
        @template.currency_select(
          @object_name,
          method,
          priority_currencies,
          options.merge(object: @object),
          html_options
        )
      end
    end
  end
end
