module ProcessingAddUserToUserCourseSubject
  def self.excute user_course
    return if user_course.user.trainer?
    course_subjects =  CourseSubject.by_course_id(user_course.course_id)
    begin
      course_subjects.each  do |course_subject|
        UserCourseSubject.new(user_id: user_course.user_id,
                              course_subject_id: course_subject.id,
                              duration: course_subject.duration,
                              order: course_subject.order,
                              status: Settings.status_2).save
      end
    rescue => e
      p e.message
    end
    order_min  = UserCourseSubject.by_user_id(user_course.user_id).minimum(:order)
    course_subject_first = UserCourseSubject.find_by(user_id: user_course.user_id, order: order_min)
    return if course_subject_first.blank?
    begin
      course_subject_first.running!
    rescue => e
      p e.message
    end
  end
end
