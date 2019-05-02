class BoxLinter::Model::Folder < BoxLinter::Model::AbstractEntry
  def self.project_root
    BoxLinter::Client.find(ENV['BOX_PROJECT_ROOT'], 'folder')
  end

  def initialize(result)
    super(result)
  end
end