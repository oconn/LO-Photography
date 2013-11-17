class SitemapsController < ApplicationController

  def show
    # Redirect to CloudFront and S3
    redirect_to "http://s3.amazonaws.com/lo-photography/sitemaps/sitemap1.xml.gz"
  end

end