class ChangeFileExcelToBeAttachmentInUserCourseTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_course_tasks, :file_excel
  end
end
