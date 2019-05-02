require 'yaml'

class BoxLinter::Model::Cop
  attr_reader :id, :parent

  def initialize(result)
    @id = result.id
    @parent = result.parent
    @rules = _parse_setting_file

  end

  def check
    sibiling = BoxLinter::Client.find(@parent).children

    warnings = []

    sibiling.each do |s|
      p s
      w = {id: s.id}
      next if s.id == @id
      next unless @rules[:ignore_pattern].select{ |r| r === s.name }.empty?

      if @rules[:description] && s.description.empty?
        w[:description] = true
      end

      if @rules[:name] && ! @rules[:name] =~ s.name
        w[:name] = true
      end
      warnings << w
    end

    warnings
  end

  private

  def _parse_setting_file
    content = BoxLinter::Client.downlad(@id)
    rule = YAML.load(content, symbolize_names: true)
    rule[:name] = %r[#{rule[:name]}]
    rule[:ignore_pattern]&.map! { |str| %r[#{str}] }
    rule
  end
end