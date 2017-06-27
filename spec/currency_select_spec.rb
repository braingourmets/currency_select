# frozen_string_literal: true

require 'spec_helper'
require 'action_view'
require 'currency_select'

module ActionView
  module Helpers

    describe CurrencySelect do
      include TagHelper

      class User
        attr_accessor :currency_code
      end

      let(:user) { User.new }
      let(:template) { ActionView::Base.new }
      let(:select_tag) do
        "<select name=\"user[currency_code]\" id=\"user_currency_code\">"
      end

      let(:selected_eur_option) do
        if defined?(Tags::Base)
          content_tag(:option, 'Euro - EUR', selected: :selected, value: 'EUR')
        else
          '<option value="EUR" selected="selected">Euro - EUR</option>'
        end
      end

      let(:builder) do
        if defined?(Tags::Base)
          FormBuilder.new(:user, user, template, {})
        else
          FormBuilder.new(:user, user, template, {}, Proc.new { })
        end
      end

      describe "currency_select" do
        let(:tag) { builder.currency_select(:currency_code) }

        it "creates a select tag" do
          expect(tag).to include(select_tag)
        end

        it "creates option tags for each currency" do
          ::CurrencySelect.currencies_array.each do |name, code|
            expect(tag).to include(content_tag(:option, name, value: code))
          end
        end

        it "selects the value of currency_code" do
          user.currency_code = 'EUR'
          t = builder.currency_select(:currency_code)
          expect(t).to include(selected_eur_option)
        end

        it "does not mark two currencies as selected" do
          user.currency_code = 'USD'
          expect(tag.scan(/selected="selected"/).count).to eq(1)
        end

        describe "priority currencies" do
          let(:tag) { builder.currency_select(:currency_code, ['EUR']) }

          it "inserts the priority currencies at the top" do
            expect(tag).to include("#{select_tag}<option value=\"EUR")
          end

          it "inserts a divider" do
            expect(tag).to include('<option value="" disabled="disabled">-------------</option>')
          end
        end
      end
    end
  end
end
