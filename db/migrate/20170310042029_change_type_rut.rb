class ChangeTypeRut < ActiveRecord::Migration
  def up
    change_table :providers do |t|
      t.change :rut, :string
    end
    change_table :purchases do |t|
      t.change :provider_rut, :string
    end
  end

  def down
    change_table :providers do |t|
      t.change :rut, :integer
    end
    change_table :purchases do |t|
      t.change :provider_rut, :integer
    end
  end
end
