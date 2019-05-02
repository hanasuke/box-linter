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

    warning = {
        id: @parent.id,
        name: @parent.name,
        alerts: []
    }

    sibiling.each do |s|
      next if s.id == @id
      next unless @rules[:ignore_pattern].select{ |r| r === s.name }.empty?
      w = {id: s.id, name: s.name}

      if @rules[:description] && s.description.empty?
        w[:description_failure] = true
      end

      if @rules[:name] && ! @rules[:name].match?(s.name)
        w[:name_failure] = true
      end
      warning[:alerts] << w
    end

    warning
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