class Bill < ApplicationRecord
  # Enum mapping with the new column name
  enum bill_type: { food: 'Food', travel: 'Travel', others: 'Others' }
  enum status: { pending: 'Pending', approved: 'Approved', rejected: 'Rejected' }
  
  belongs_to :employee
  
  # Validations
  validates :amount, presence: true
  validates :bill_type, presence: true
  validates :status, presence: true
end
