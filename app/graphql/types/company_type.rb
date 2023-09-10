module Types
  class CompanyType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :invoices, [Types::InvoiceType], null: false

    def invoices
      Invoice.where(company_id: object.id, user_id: context[:current_user].id)
    end
  end
end
