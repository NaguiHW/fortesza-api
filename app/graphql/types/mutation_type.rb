module Types
  class MutationType < Types::BaseObject
    field :company_create, mutation: Mutations::CompanyCreate
  end
end
