User.create!(name:  "vo van tra",
             email: "vovantra@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             role: 1,
             birthday: "01/01/2001",
             deleted: false)
User.create!(name:  "vo van tri",
             email: "vovantri@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             birthday: "01/01/2001",
             deleted: false)
User.create!(name:  "vo van tre",
             email: "vovantre@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             birthday: "01/01/2001",
             deleted: false)
User.create!(name:  "vo van a",
             email: "vovantrads@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             role: 1,
             birthday: "01/01/2001",
             deleted: false)
User.create!(name:  "vo van trasd",
             email: "vovantr2@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             role: 1,
             birthday: "01/01/2001",
             deleted: false)
User.create!(name:  "vo van tr3",
             email: "vovant3@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             role: 1,
             birthday: "01/01/2001",
             deleted: false)
User.create!(name:  "admin",
             email: "admin@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             role: 2,
             birthday: "01/01/2001",
             deleted: false)
Course.create!(name: "Ruby",
               content: "Khoa hoc ruby la khoa hoc chat luong lam nghe",
               start_date: Time.now(),
               status: 1)
Course.create!(name: "PHP",
               content: "Khoa hoc php la khoa hoc chat luong lam nghe",
               start_date: Time.now(),
               status: 0)
CourseUser.create!(course_id: 1,
                    user_id: 1,
                    join_date: Time.now(),
                    status: 0,
                    deleted: false)
CourseUser.create!(course_id: 1,
                    user_id: 2,
                    join_date: Time.now(),
                    status: 0,
                    deleted: false)
CourseUser.create!(course_id: 2,
                    user_id: 1,
                    join_date: "01/01/2018",
                    status: 1,
                    deleted: false)
CourseUser.create!(course_id: 2,
                    user_id: 2,
                    join_date: "01/01/2018",
                    status: 1,
                    deleted: false)
CourseUser.create!(course_id: 2,
                    user_id: 3,
                    join_date: "01/01/2018",
                    status: 1,
                    deleted: false)
CourseUser.create!(course_id: 2,
                    user_id: 4,
                    join_date: "01/01/2017",
                    status: 1,
                    deleted: false)
CourseUser.create!(course_id: 2,
                    user_id: 5,
                    join_date: Time.now(),
                    status: 0,
                    deleted: false)
Subject.create!(name: "git",
                details: "Lorem Ipsum is simply dummy text of the printing and t
            ypesetting industry. Lorem Ipsum has been the industry's standard dummy
            text ever since the 1500s, when an unknown printer took a galley of type
            nd scrambled it to make a type specimen book. It has survived not only
            five centuries, but also the leap into electronic typesetting, remaining
            essentially unchanged. It was popularised in the 1960s with the release of
            etraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                duration_default: 2)
Subject.create!(name: "mysql",
                details: "Lorem Ipsum is simply dummy text of the printing and t
            ypesetting industry. Lorem Ipsum has been the industry's standard dummy
            text ever since the 1500s, when an unknown printer took a galley of type
            nd scrambled it to make a type specimen book. It has survived not only
            five centuries, but also the leap into electronic typesetting, remaining
            essentially unchanged. It was popularised in the 1960s with the release of
            etraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                duration_default: 3)
Subject.create!(name: "rubytutorial",
                details: "Lorem Ipsum is simply dummy text of the printing and t
            ypesetting industry. Lorem Ipsum has been the industry's standard dummy
            text ever since the 1500s, when an unknown printer took a galley of type
            nd scrambled it to make a type specimen book. It has survived not only
            five centuries, but also the leap into electronic typesetting, remaining
            essentially unchanged. It was popularised in the 1960s with the release of
            etraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                duration_default: 5)
Subject.create!(name: "rails tutorial",
                details: "Lorem Ipsum is simply dummy text of the printing and t
            ypesetting industry. Lorem Ipsum has been the industry's standard dummy
            text ever since the 1500s, when an unknown printer took a galley of type
            nd scrambled it to make a type specimen book. It has survived not only
            five centuries, but also the leap into electronic typesetting, remaining
            essentially unchanged. It was popularised in the 1960s with the release of
            etraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                duration_default: 7)
CourseSubject.create!(course_id: 1,
                      subject_id: 1,
                      duration: 2,
                      order: 1,
                      status: 2)
CourseSubject.create!(course_id: 1,
                      subject_id: 2,
                      duration: 3,
                      order: 2,
                      status: 1)
CourseSubject.create!(course_id: 1,
                      subject_id: 3,
                      duration: 5,
                      order: 3,
                      status: 0)
CourseSubject.create!(course_id: 1,
                      subject_id: 4,
                      duration: 7,
                      order: 4,
                      status: 0 )
CourseSubject.create!(course_id: 2,
                      subject_id: 1,
                      duration: 2,
                      order: 1,
                      status: 2)
CourseSubject.create!(course_id: 2,
                      subject_id: 2,
                      duration: 3,
                      order: 2,
                      status: 2)
CourseSubject.create!(course_id: 2,
                      subject_id: 3,
                      duration: 5,
                      order: 3,
                      status: 2)
CourseSubject.create!(course_id: 2,
                      subject_id: 4,
                      duration: 7,
                      order: 4,
                      status: 2)
UserCourseSubject.create!(user_id: 2,
                      course_subject_id:  1,
                      duration: 7,
                      order: 1,
                      status: 2)
UserCourseSubject.create!(user_id: 2,
                      course_subject_id:  2,
                      duration: 7,
                      order: 2,
                      status: 1)
UserCourseSubject.create!(user_id: 2,
                      course_subject_id: 3,
                      duration: 7,
                      order: 5,
                      status: 2)
Task.create!(title: "bai 1",
            content: "cho a xem chan di nao",
            subject_id: 1)
Task.create!(title: "bai 2",
            content: "cho a xem chan di nao",
            subject_id: 1)
Task.create!(title: "bai 3",
            content: "cho a xem chan di nao",
            subject_id: 1)
Task.create!(title: "bai 1",
            content: "cho a xem chan di nao",
            subject_id: 2)
Task.create!(title: "bai 2",
            content: "cho a xem chan di nao",
            subject_id: 3)
Task.create!(title: "bai 4",
            content: "cho a xem chan di nao",
            subject_id: 1)
Task.create!(title: "bai 3",
            content: "cho a xem chan di nao",
            subject_id: 4)

