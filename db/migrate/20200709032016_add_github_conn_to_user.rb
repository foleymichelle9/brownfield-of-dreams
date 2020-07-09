class AddGithubConnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :github_conn, :string, :default => "false"
  end
end
