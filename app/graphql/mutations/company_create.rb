module Mutations
  class CompanyCreate < BaseMutation
    description 'Creates a new company'

    argument :company_input, Types::CreateCompanyInputType, required: true

    field :company, Types::CompanyType
    field :errors, [String]

    def resolve(company_input:)
      company = Company.new(company_input.to_h)

      if company.save
        {
          company:,
          errors: []
        }
      else
        {
          company: nil,
          errors: company.errors.full_messages
        }
      end
    end
  end
end
