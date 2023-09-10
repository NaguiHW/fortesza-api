module Types
  class MutationType < Types::BaseObject
    field :invoice_create, mutation: Mutations::InvoiceCreate
    field :company_create, mutation: Mutations::CompanyCreate
  end
end
