module Types
  class CreateInvoiceInputType < Types::BaseInputObject
    description 'Attributes for creating an invoice'
    argument :company_id, ID, required: true
    argument :amount, Float, required: true
    argument :expected_amount, Float, required: true
    argument :start_date, GraphQL::Types::ISO8601Date, required: true
    argument :end_date, GraphQL::Types::ISO8601Date, required: true
    argument :fortesza_id, String, required: true
    argument :status, Types::InvoiceStatusType, required: true
  end
end
