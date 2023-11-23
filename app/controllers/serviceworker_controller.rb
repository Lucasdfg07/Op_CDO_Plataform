class ServiceworkerController < ApplicationController
  def serviceworker
    render file: "public/serviceworker.js", content_type: 'application/javascript', layout: false
  end

  def manifest
    render file: "public/manifest.json", content_type: 'application/json', layout: false
  end
end
