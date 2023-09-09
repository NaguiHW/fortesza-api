module Types
  class CreateCompanyInputType < Types::BaseInputObject
    argument :name, String, required: true
  end
end
