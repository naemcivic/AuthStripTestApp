class RemoveForiegnKeyCourses < ActiveRecord::Migration
  def change
    remove_foreign_key :courses, :user
  end
end
