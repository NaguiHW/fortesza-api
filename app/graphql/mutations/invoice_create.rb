module Mutations
  class InvoiceCreate < BaseMutation
    description 'Creates a new invoice'

    argument :invoice_input, Types::CreateInvoiceInputType, required: true

    field :invoice, Types::InvoiceType
    field :errors, [String]

    def resolve(invoice_input:)
      invoice = Invoice.new(invoice_input.to_h)
      invoice.user_id = context[:current_user].id
      
      if invoice.save
        {
          invoice:,
          errors: []
        }
      else
        {
          invoice: nil,
          errors: invoice.errors.full_messages
        }
      end
    end
  end
end
