# module Types
  class Types::InvoiceStatusType < Types::BaseEnum
    description 'Invoice status enum'

    value 'IN_PROGRESS', value: 'in_progress'
    value 'LATE', value: 'late'
    value 'COLLECTED', value: 'collected'
  end
# end
