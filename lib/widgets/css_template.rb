module Widgets
  # Utility module for widgets that need to create a default CSS
  # you have to include it inside a Widget to add css_generation capability
  module CssTemplate
    
    def render_css(name)
      @_widgets_css_templates ||= {}
      return @_widgets_css_templates[name] if @_widgets_css_templates[name] # return the cached copy if possible
      # if not cached read and evaluate the template
      css_template_filename = "#{name}.css.erb" 
      css_template = ERB.new IO.read(File.join(File.dirname(__FILE__), css_template_filename))
      @_widgets_css_templates[name] = css_template.result(binding)
    end 
    
    # should the helper generate a css for this widget?
    def generate_css?
      @generate_css ? true : false
    end
    
  end
end
