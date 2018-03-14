task :setup_data => :environment do 
	10.times do 
		Instructor.create(name: Faker::Name.first_name, bio: Faker::Lorem.paragraph, email: Faker::Internet.free_email)
	end
	

	Course.create(name: "Ruby on Rails", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "Intoduction to Programming", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "Introduction to JavaScript", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "JS + AJAX", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "C Programming", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "Boostrap", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)

	200.times do 
		student = Student.create(name: Faker::Name.first_name, email: Faker::Internet.free_email, major: ["CS", "IS", "EC", "EEE", "MECH", "CIVIL", "EIE"].sample)
		course_ids = Course.all.pluck(:id).sample(2)
		course_ids.each do |course_id|
			Registration.create(student_id: student.id, course_id: course_id)
		end
	end
end