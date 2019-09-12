class AddAttachmentFileExcelToUserCourseTasks < ActiveRecord::Migration[5.2]
  def self.up
    change_table :user_course_tasks do |t|
      t.attachment :file_excel
    end
  end

  def self.down
    remove_attachment :user_course_tasks, :file_excel
  end
end
