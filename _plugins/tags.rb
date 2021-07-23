module Tags
  class TagPageGenerator < Jekyll::Generator
    safe true
    def generate(site)
      site.tags.each do |tag, _|
        site.pages << TagPage.new(site, tag)
      end
    end
  end

  class TagPage < Jekyll::Page
    def initialize(site, tag)
      @site = site 
      @base = site.source
      @dir  = 'tags'
      @basename = tag
      @ext = '.html'
      @name = @basename + @ext

      self.read_yaml(File.join(@base, '_layouts'), 'tag.html')
      self.data['tag'] = tag

    end
  end
end