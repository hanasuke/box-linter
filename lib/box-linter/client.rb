class BoxLinter::Client
  def self.find(id, type='folder')
    client = Boxr::Client.new
    result = case type
             when 'folder'
               client.folder_from_id(id)
             when 'file'
               client.file_from_id(id)
             else
               raise NotImplementedError
             end
    BoxLinter::EntryFactory.generate(result)
  end
end