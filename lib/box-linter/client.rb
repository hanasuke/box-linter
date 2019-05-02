class BoxLinter::Client
  class << self
    def find(id, type='folder')
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

    def search(query)
      client = Boxr::Client.new
      instances = []
      client.search(query).entries.each do |e|
        instances << BoxLinter::EntryFactory.generate(e)
      end
      instances
    end

    # download file
    def downlad(id)
      client = Boxr::Client.new
      param = Hashie::Mash.new({id: id})
      client.download_file(param)
    end
  end
end