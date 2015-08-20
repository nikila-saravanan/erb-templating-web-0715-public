
class SiteGenerator

  def make_index!
    template = "<!DOCTYPE html><html><head><title>Movies</title></head><body><ul>"
    Movie.all.each do |movie|
      template += "<li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>"
    end
    total_template = template + "</ul></body></html>"

    File.open("_site/index.html","w+") {|f| f.puts total_template}
  end

  def generate_pages!
    template = File.read('lib/templates/movie.html.erb')
    text = ERB.new(template)
    Movie.all.each do |movie|
      erb_text = text.result(binding)
      File.open("_site/movies/#{movie.url}","w+") {|f| f.puts erb_text}
    end
  end

end