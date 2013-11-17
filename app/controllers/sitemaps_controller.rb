class SitemapsController < ApplicationController

  def show
    # Redirect to CloudFront and S3
    redirect_to "http://your-distribution-id.cloudfront.net/sitemaps/sitemap1.xml.gz"
  end

end