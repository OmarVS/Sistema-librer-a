class AddReferencesBetweenBooksAndProviders < ActiveRecord::Migration
  def change
    add_reference :book, :purchase, index: true, foreign_key: true
    add_reference :provider, :purchase, index: true, foreign_key: true
    add_reference :purchase, :provider, index: true, foreign_key: true
    add_reference :purchase, :book, index: true, foreign_key: true
  end
end
