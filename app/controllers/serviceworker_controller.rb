class ServiceworkerController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:serviceworker, :manifest]
  skip_before_filter :authenticate_user!

  def serviceworker
    render file: "public/serviceworker.js", content_type: 'application/javascript', layout: false
  end

  def manifest
    render file: "public/manifest.json", content_type: 'application/json', layout: false
  end
end
