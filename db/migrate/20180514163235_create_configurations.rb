class CreateConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.column :active, :boolean
      t.column :name, :string
      t.column :mode, :string
      t.column :color, :string
      t.column :brightness, :decimal, precision: 3, scale: 2 
    end
  end
end
