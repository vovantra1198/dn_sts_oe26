User.create!(name:  "vo van tra",
             email: "vovantra@gmail.com",
             password: "123123",
             password_confirmation: "123123")
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
                    status: 0)
CourseUser.create!(course_id: 2,
                    user_id: 1,
                    join_date: Time.now(),
                    status: 1)
Subject.create!(name: "git",
                details: "this is a great",
                duration_default: 2)
Subject.create!(name: "mysql",
                details: "this is a great",
                duration_default: 3)
Subject.create!(name: "rubytutorial",
                details: "this is a great",
                duration_default: 5)
Subject.create!(name: "rails tutorial",
                details: "this is a great",
                duration_default: 7)
CourseSubject.create!(course_id: 1,
                      subject_id: 1,
                      duration: 2,
                      order: 1,
                      status: 1)
CourseSubject.create!(course_id: 1,
                      subject_id: 2,
                      duration: 3,
                      order: 2,
                      status: 0)
CourseSubject.create!(course_id: 1,
                      subject_id: 3,
                      duration: 5,
                      order: 3,
                      status: 0)
CourseSubject.create!(course_id: 1,
                      subject_id: 4,
                      duration: 7,
                      order: 4,
                      status: 0)
Task.create!(title: "Chuong 1",
            content: "Lorem Ipsum is simply dummy text of the printing and t
            ypesetting industry. Lorem Ipsum has been the industry's standard dummy
            text ever since the 1500s, when an unknown printer took a galley of type
            nd scrambled it to make a type specimen book. It has survived not only
            five centuries, but also the leap into electronic typesetting, remaining
            essentially unchanged. It was popularised in the 1960s with the release of
            etraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
            subject_id: 1)
Task.create!(title: "Chuong 2",
            content: "Lorem Ipsum is simply dummy text of the printing and t
            ypesetting industry. Lorem Ipsum has been the industry's standard dummy
            text ever since the 1500s, when an unknown printer took a galley of type
            nd scrambled it to make a type specimen book. It has survived not only
            five centuries, but also the leap into electronic typesetting, remaining
            essentially unchanged. It was popularised in the 1960s with the release of
            etraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
            subject_id: 1)
Task.create!(title: "Chuong 3",
            content: "Lorem Ipsum is simply dummy text of the printing and t
            ypesetting industry. Lorem Ipsum has been the industry's standard dummy
            text ever since the 1500s, when an unknown printer took a galley of type
            nd scrambled it to make a type specimen book. It has survived not only
            five centuries, but also the leap into electronic typesetting, remaining
            essentially unchanged. It was popularised in the 1960s with the release of
            etraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
            subject_id: 1)
