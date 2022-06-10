# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = active
      filtering_params.each do |key, value|
        next if value.blank?

        case key
        when 'author' then results = results.filter_by_author value
        when 'tag' then results = results.filter_by_tag value
        end
      end
      results
    end
  end
end
