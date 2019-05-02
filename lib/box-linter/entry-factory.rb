class BoxLinter::EntryFactory
  def self.generate(params)
    klass = params['type'].capitalize
    begin
      return "BoxLinter::Model::#{klass}".constantize.new(params)
    rescue => e
      ap e
      puts "undefined class: #{klass}"
    end
  end
end