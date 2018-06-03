# frozen_string_literal: true

class AddMultiColumnIndexToEvents < ActiveRecord::Migration[5.2]
  def change
    add_index :events, %i[object_type object_id timestamp]
  end
end
