# frozen_string_literal: true

require 'currency_select_tag'
require 'form_builder'
require 'form_options_helper'
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
