class BoxLinter::Model::Folder < BoxLinter::Model::AbstractEntry
  def self.project_root
    BoxLinter::Client.find(ENV['BOX_PROJECT_ROOT'], 'folder')
  end

  def initialize(result)
    super(result)
    @children = []
    result.children.each do |e|
      @children << { id: e.id, type: e.type }
    end
  end

  # return child entries instance
  def children
    instances = []
    @children.each do |c|
      instances << BoxLinter::Client.find(c[:id], c[:type])
    end

    instances
  end
end