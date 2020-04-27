# frozen_string_literal: true

require 'money'

##
# Module for creating currency drop-downs.
#
module CurrencySelect
  class << self
    ##
    # Money::Currency::table is a hash of this format for each entry:
    # id (lowercase) => {
    #   priority: 2,
    #   iso_code: "EUR",
    #   name: "Euro",
    #   symbol: "$",
    #   alternate_symbols: [],
    #   subunit: "Cent",
    #   subunit_to_unit: 100,
    #   symbol_first: true,
    #   html_entity: "&#x20AC;"
    #   decimal_mark:  ",",
    #   thousands_separator: ".",
    #   iso_numeric: "978"
    #   smallest_denomination: 1
    # }
    unless const_defined?('CURRENCIES')
      CURRENCIES = Money::Currency.table.inject([]) do |array, (_, currency)|
        array << [
          "#{currency[:name]} - #{currency[:iso_code]}", currency[:iso_code]
        ]
      end
      # sort by the label (not by the ISO code)
      CURRENCIES.sort_by(&:first)
    end

    ##
    # Returns a two-dimensional array with ISO codes and currency names for
    # <tt>option</tt> tags.
    #
    # In the outer array, there will be one element for each currency. Each
    # element looks like this, containing a label and the ISO code:
    # ["Afghan Afghani - AFN", "AFN"]
    #
    # @return [Array]
    #
    def currencies_array
      CURRENCIES
    end

    ##
    # Returns an array with ISO codes and currency names for currency ISO codes
    # passed as an argument
    # == Example
    #   priority_currencies_array([ "USD", "NOK" ])
    #   # => [
    #   #  ['United States Dollar - USD', 'USD' ],
    #   #  ['Norwegian Kroner - NOK', 'NOK']
    #   # ]
    #
    # @return [Array]
    #
    def priority_currencies_array(currency_codes = [])
      currency_codes.flat_map do |code|
        currencies_array.select { |currency| currency.last.to_s == code }
      end
    end
  end
end

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
          raw = '<option value="" disabled="disabled">-------------</option>'
          currency_options += raw.html_safe + "\n"

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

    ##
    # Tag.
    #
    class CurrencySelectTag < Tags::Base
      include ToCurrencySelectTag
    end

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
