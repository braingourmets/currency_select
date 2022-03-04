# frozen_string_literal: true

require 'money'

# CurrencySelect
module ActionView
  module Helpers
    ##
    # Module for the form options.
    #
    module FormOptionsHelper
      # Return select and option tags for the given object and method, using
      # currency_options_for_select to generate the list of option tags.
      def currency_select(
        object, method, priority_currencies = nil, options = {},
        html_options = {}
      )
        tag = CurrencySelectTag.new(object, method, self, options)
        tag.to_currency_select_tag(priority_currencies, options, html_options)
      end

      # Returns a string of option tags for all available currencies. Supply
      # a currency ISO code as +selected+ to have it marked as the selected
      # option tag. You can also supply an array of currencies as
      # +priority_currencies+, so that they will be listed above the rest of
      # the list.
      def currency_options_for_select(selected = nil, priority_currencies = nil)
        currency_options = ''.html_safe

        if priority_currencies
          currency_options += options_for_select(
            ::CurrencySelect.priority_currencies_array(priority_currencies),
            selected
          )
          label = '-------------'.html_safe
          option = content_tag(:option, label, value: '', disabled: 'disabled')
          currency_options += option

          # prevents selected from being included twice in the HTML which causes
          # some browsers to select the second selected option (not priority)
          # which makes it harder to select an alternative priority country
          selected = nil if priority_currencies.include?(selected)
        end

        # All the countries included in the country_options output.
        currency_options + options_for_select(
          ::CurrencySelect.currencies_array, selected
        )
      end
    end
  end
end
