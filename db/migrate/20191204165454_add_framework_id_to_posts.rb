class AddFrameworkIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :framework, foreign_key: true
  end
end
