class AddReferencesToProvider < ActiveRecord::Migration
  def change
    add_reference :providers, :purchase, index: true, foreign_key: true
  end
end
