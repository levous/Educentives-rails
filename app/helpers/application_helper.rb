module ApplicationHelper
  class StyledFormBuilder < ActionView::Helpers::FormBuilder
    def submit(options={})
      css_class = options[:class].nil? ? 'btn' : options[:class] + ' btn'
      super :class => css_class
    end
  end
  ActionView::Base.default_form_builder = StyledFormBuilder
end
