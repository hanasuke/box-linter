class BoxLinter::Model::AbstractEntry
  attr_reader :name, :parent, :created_at, :updated_at

  def initialize(result)
    # result => {
    #             name: 'name',
    #             parent: '1234567',
    #             content_created_at: 'date',
    #             content_modified_at: 'date',
    #           }

    @name = result.name
    @parent = result.parent
    @created_at = result.content_created_at
    @updated_at = result.content_modified_at
  end
end