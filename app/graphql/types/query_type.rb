module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: 'Fetches an object given its ID.' do
      argument :id, ID, required: true, description: 'ID of the object.'
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, { null: true }], null: true,
                                                     description: 'Fetches a list of objects given a list of IDs.' do
      argument :ids, [ID], required: true, description: 'IDs of the objects.'
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :invoices, [Types::InvoiceType], null: false do
      description 'Returns a list of invoices'
      argument :id, ID, required: false
      argument :status, Types::InvoiceStatusType, required: false
    end

    def invoices(status: nil)
      current_user = context[:current_user]
      invoice = Invoice.all.where(user_id: current_user.id)
      invoice = invoice.where(status:) if status.present?
      invoice
    end

    field :companies, [Types::CompanyType], null: false do
      description 'Returns a list of companies'
      argument :id, ID, required: false
    end

    def companies(id: nil)
      company = Company.all
      company = company.where(id:) if id.present?
      company
    end
  end
end
