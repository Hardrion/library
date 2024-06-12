class RenameSypnosisColumnName < ActiveRecord::Migration[7.1]
  def change 
    rename_column :books, :sypnosis , :synopsis
  end
end
