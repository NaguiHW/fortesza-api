module Types
  class InvoiceType < Types::BaseObject
    field :id, ID, null: false
    field :amount, Float
    field :collected_amount, Float
    field :expected_amount, Float
    field :start_date, GraphQL::Types::ISO8601Date
    field :end_date, GraphQL::Types::ISO8601Date
    field :collected_date, GraphQL::Types::ISO8601Date
    field :fortesza_id, String
    field :status, Types::InvoiceStatusType, null: false
    field :company, Types::CompanyType, null: false

    def company
      Company.find(object.company_id)
    end
  end
end
