class CreateEMails < ActiveRecord::Migration[6.0]
  def change
    create_table :e_mails do |t|


      t.integer :sending_mail_id
      t.integer :receiving_mail_id
      t.text    :message 

      t.timestamps
    end
  end
end
