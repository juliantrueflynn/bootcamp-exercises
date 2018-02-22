require 'active_support'
require 'active_support/core_ext'
require 'erb'
require 'byebug'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, params = {})
    @req = req
    @res = res
    @already_built_response = false
    @params = req.params.merge(params)
    @session = nil
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise Error.new("Double render!") if already_built_response?
    @res.location = url
    @res.status = 302
    @already_built_response = true
    session.store_session(@res)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise Error.new("Oops!") if already_built_response?
    @res['Content-Type'] = content_type
    @res.body = [content]
    @already_built_response = true
    session.store_session(@res)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    file_name = "#{template_name}.html.erb"
    controller_name = self.class.to_s.underscore
    
    template_file = File.open("./views/#{controller_name}/#{file_name}")
    render_content(ERB.new(template_file.read).result(binding), 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    self.send(name)
    render(name) unless already_built_response?

    nil
  end
end

