class ServiceworkerController < ApplicationController
  def serviceworker
    render file: "#{Rails.root}/app/javascript/serviceworker.js", content_type: 'application/javascript', layout: false
  end

  def manifest
    render file: "#{Rails.root}/app/assets/javascripts/manifest.json.erb", content_type: 'application/json', layout: false
  end
end
