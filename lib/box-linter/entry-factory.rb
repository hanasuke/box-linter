class BoxLinter::EntryFactory
  def self.generate(params)
    klass = params['type'].capitalize
    klass = 'Cop' if params['name'].include? 'boxlint'
    begin
      return "BoxLinter::Model::#{klass}".constantize.new(params)
    rescue => e
      ap e
      puts "undefined class: #{klass}"
    end
  end
end