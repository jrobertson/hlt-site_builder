#!/usr/bin/env ruby

# file: hlt-site_builder.rb

require 'dynarex'
require 'hlt'
require 'fileutils'


class String

  def to_html()
    Hlt.new(self.gsub(/^(?=[^\n])/,'  ').sub(/^\s{2}/,'')).to_html
  end

  def to_doc()  Rexle.new(self.to_html)  end
end

class HltSiteBuilder

  def initialize(file, options={})
    @opt = {style: true}.merge options
    @dynarex = Dynarex.new
    @dynarex.parse File.read file
  end

  def generate()

    keys = @dynarex.records.keys
    @template = keys.shift

    @pages = keys.inject({}) do |r, x| 
      label, val = x.split(/\n/,2)
      r.merge({label.strip.to_sym => val})
    end

    generate_pages @pages.keys
  end

  def write()

    pages = @pages.to_a
    pages[0][0] = 'index'
    pages.each do |pg_name, content| 
      filename = format_filename(pg_name)
      content = File.read filename
      yield(filename, content) 
    end
  end

  private

  def format_filename(name)
    "%s.html" % name.to_s.downcase.gsub(' ','-')
  end

  alias f format_filename

  # generate the html for the 1st item.
  #
  def generate_pages(a)

    container_id = @opt[:container_id]

    a.each do |name|

      doc = @template.to_doc
      doc2 = ("div {id: '#{container_id}'}\n" + @pages[name]).to_doc

      yield(doc2) if block_given?

      e = doc.element("//div[@id='#{container_id}']")
      e.insert_before doc2.root
      e.delete

      title = doc.root.element('head/title')
      title.text = name.to_s + ' | ' + title.text.unescape

      filename = format_filename(name)

      if @opt[:style] == false then
        doc.root.xpath('//.[@style]').each {|e| e.attributes.delete :style}
      end

      puts 'saving_ ' + filename
      File.write filename, doc.content
    end

    FileUtils.mv f(a[0]), 'index.html'
  end

end

if __FILE__ == $0 then

  hsb = HltSiteBuilder.new('pages.txt', style: false, container_id: 'main')
  hsb.generate
=begin
  hsb.write do |filename, buffer| 
    File.write filename, buffer.sub(/Sitemap<\/a>\s+<\/li>/m,'\0|')
  end
=end
end