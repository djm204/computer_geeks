# encoding: UTF-8
#
class AboutsController < InheritedResources::Base
  def index
    @about = About.first
  end
end
