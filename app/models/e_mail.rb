class EMail < ApplicationRecord
  self.table_name = :e_mails

  belongs_to :sending_mail
  belongs_to :receiving_mail
end
