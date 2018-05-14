class CreateConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :configurations do |t|
      t.column :active, :boolean
      t.column :mode, :string
      t.column :color, :string
      t.column :brightness, :decimal, precision: 2
    end
  end
end
