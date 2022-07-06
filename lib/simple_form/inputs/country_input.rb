# frozen_string_literal: true
module SimpleForm
  module Inputs
    class CountryInput < CollectionSelectInput
      def input(wrapper_options = nil)
        merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

        @builder.send(:country_select,
                      attribute_name,
                      input_options.merge(priority_countries: input_priority),
                      merged_input_options)
      end

      def input_priority
        options[:priority] || SimpleForm.send(:country_priority)
      end

      protected

      def skip_include_blank?
        super || input_priority.present?
      end
    end
  end
end
