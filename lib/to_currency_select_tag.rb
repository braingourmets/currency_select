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
        add_default_html_options(html_options)
        value = if method(:value).arity.zero?
                  options.fetch(:selected) { value() }
                else
                  options.fetch(:selected) { value(object) }
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

      def add_default_html_options(options, field = 'id')
        index = name_and_id_index(options)
        options['name'] = options.fetch('name') { tag_name(options['multiple'], index) }

        return unless generate_ids?

        options[field] = options.fetch(field) { tag_id(index, options.delete('namespace')) }
        namespace = options.delete('namespace')
        return unless namespace

        options[field] = options[field] ? "#{namespace}_#{options[field]}" : namespace
      end
    end
  end
end
