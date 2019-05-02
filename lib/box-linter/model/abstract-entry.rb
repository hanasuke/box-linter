class BoxLinter::Model::AbstractEntry
  attr_reader :id, :name, :parent, :description, :created_at, :updated_at

  def initialize(result)
    # result => {
    #             name: 'name',
    #             parent: '1234567',
    #             content_created_at: 'date',
    #             content_modified_at: 'date',
    #           }

    @id = result.id.to_i
    @name = result.name
    @parent = result.parent
    @description = result.description
    @created_at = result.content_created_at
    @updated_at = result.content_modified_at
  end
end