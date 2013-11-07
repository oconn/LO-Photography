# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.lofirefly.com"

SitemapGenerator::Sitemap.create do
  # Notice the below if you're hosting Jekyll/Octopress in a subdirectory
  # or otherwise want to index content outside of Rails' routes.
  # add_to_index '/path/sitemap.xml' 
  add '/galleries'
  add '/about'
  add '/process'
  add '/rates_raves'
  add '/contact/new'
  add '/users/sign_in'
  
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  add '/posts', :priority => 0.7, :changefreq => 'daily'

  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  #
  #      
  Post.find_each do |post|
    add post_path(post), :lastmod => post.updated_at
  end
end

after "deploy", "refresh_sitemaps"
task :refresh_sitemaps do
  run "cd #{latest_release} && RAILS_ENV=#{rails_env} rake sitemap:refresh"
end
