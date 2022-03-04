# frozen_string_literal: true

# CurrencySelect
module ActionView
  module Helpers
    ##
    # Tag.
    #
    module ToCurrencySelectTag
      def to_currency_select_tag(priority_currencies, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = if method(:value).arity.zero?
                  value()
                else
                  value(object)
                end
        content_tag(
          'select',
          add_options(
            currency_options_for_select(value, priority_currencies),
            options,
            value
          ),
          html_options
        )
      end
    end
  end
end
