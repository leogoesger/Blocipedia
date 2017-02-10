class AddUserNameToCollaborator < ActiveRecord::Migration
  def change
    add_column :collaborators, :UserName, :string
  end
end
