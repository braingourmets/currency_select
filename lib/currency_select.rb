require "money"

module CurrencySelect
  class << self

    CURRENCIES = Money::Currency::table.inject([]) do |array, (id, currency)|
      array << [ "#{currency[:name]} - #{currency[:iso_code]}", id ]
    end.sort_by { |currency| currency.first.parameterize } unless const_defined?("CURRENCIES")

    # Returns an array with ISO codes and currency names for <tt>option</tt>
    # tags.
    def currencies_array
      CURRENCIES
    end

    # Return an array with ISO codes and currency names for currency ISO codes
    # passed as an argument
    # == Example
    #   priority_currencies_array([ "USD", "NOK" ])
    #   # => [ ['United States Dollar - USD', 'USD' ], ['Norwegian Kroner - NOK', 'NOK'] ]
    def priority_currencies_array(currency_codes = [])
      currencies_array.select { |currency| currency_codes.include?(currency.last) }
    end

  end
end

# CurrencySelect
module ActionView
  module Helpers

    module FormOptionsHelper

      # Return select and option tags for the given object and method, using
      # currency_options_for_select to generate the list of option tags.
      def currency_select(object, method, priority_currencies = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_currency_select_tag(priority_currencies, options, html_options)
      end

      # Returns a string of option tags for all available currencies. Supply
      # a currency ISO code as +selected+ to have it marked as the selected
      # option tag. You can also supply an array of currencies as
      # +priority_currencies+, so that they will be listed above the rest of
      # the list.
      def currency_options_for_select(selected = nil, priority_currencies = nil)

        currency_options = ""
        if priority_currencies
          currency_options += options_for_select(CurrencySelect::priority_currencies_array(priority_currencies), selected)
          currency_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
        end
        return currency_options + options_for_select(CurrencySelect::currencies_array - CurrencySelect::priority_currencies_array(priority_currencies), selected)
        
      end

    end

    class InstanceTag
      def to_currency_select_tag(priority_currencies, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select", add_options(currency_options_for_select(value, priority_currencies), options, value), html_options)
      end
    end

    class FormBuilder
      def currency_select(method, priority_currencies = nil, options = {}, html_options = {})
        @template.currency_select(@object_name, method, priority_currencies, options.merge(:object => @object), html_options)
      end
    end

  end
end
