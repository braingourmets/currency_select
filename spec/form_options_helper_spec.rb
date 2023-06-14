# frozen_string_literal: true

require 'spec_helper'
require 'action_view'
require 'currency_select'

module ActionView
  module Helpers
    describe CurrencySelectTag do
      let(:tag) do
        template_object = ActionView::Base.new(ActionView::LookupContext.new([]), {}, nil)
        CurrencySelectTag.new('user', 'currency', template_object, {})
      end

      describe 'currency_select' do
        it 'should not have a selected option' do
          expect(tag.to_currency_select_tag(nil, {}, {}).scan(/selected="selected"/).count).to eq(0)
        end

        it 'should have a selected option' do
          expect(tag.to_currency_select_tag(nil, { selected: 'XTS' }, {}).scan(/selected="selected"/).count).to eq(1)
        end
      end
    end
  end
end
