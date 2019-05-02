class BoxLinter::Client
  def initialize
    @client = Boxr::Client.new
  end

  def root
    BoxLinter::EntryFactory.generate @client.folder_from_id(ENV['BOX_PROJECT_ROOT'])
  end

  def find(id, type='folder')
    result = case type
             when 'folder'
               @client.folder_from_id(id)
             when 'file'
               @client.file_from_id(id)
             else
               raise NotImplementedError
             end
    BoxLinter::EntryFactory.generate(result)
  end
end