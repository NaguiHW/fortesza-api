class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices, id: :uuid do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :collected_amount, precision: 10, scale: 2
      t.decimal :expected_amount, precision: 10, scale: 2
      t.date :start_date
      t.date :end_date
      t.date :collected_date
      t.string :fortesza_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
