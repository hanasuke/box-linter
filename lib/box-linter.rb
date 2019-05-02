require 'json'

$LOAD_PATH  << File.join(File.dirname(__FILE__), '../lib/')

Bundler.require(:default)

Dotenv.load

# monkeypatch for BoxrMash
class BoxrMash
  def children
    self["item_collection"]["entries"]
  end
end

module BoxLinter; end

#p Dir.glob(File.join(File.dirname(__FILE__), '**/*.rb')).sort
Dir.glob(File.join(File.dirname(__FILE__), '**/*.rb')).sort.each do |f|
  require f
end