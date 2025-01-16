# frozen_string_literal: true

require 'spec_helper'
# This line can be dropped once we no longer support Rails 7.0.
require 'logger'
# This line can be dropped once we no longer support Rails 7.1 and 7.2.
require 'uri'
require 'action_view'
require 'currency_select'

module ActionView
  module Helpers
    describe CurrencySelectTag do
      let(:tag) do
        template_object = ActionView::Base.new(ActionView::LookupContext.new([]), {}, nil)
        described_class.new('user', 'currency', template_object, {})
      end

      describe 'to_currency_select_tag' do
        it 'does not have a selected attribute when not passing a value to be preselected' do
          expect(tag.to_currency_select_tag(nil, {}, {}).scan('selected="selected"').count).to eq(0)
        end

        it 'has a selected attribtue when given a value to preselect' do
          expect(tag.to_currency_select_tag(nil, { selected: 'XTS' }, {}).scan('selected="selected"').count).to eq(1)
        end
      end
    end
  end
end
