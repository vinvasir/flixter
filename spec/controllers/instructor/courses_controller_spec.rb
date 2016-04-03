require 'rails_helper'

RSpec.describe Instructor::CoursesController, type: :controller do
  describe "instructor/courses#new" do
    it "should successfully show the new form" do

      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "instructor/courses#create" do
    it "should successfully create a new course in our database" do

      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user

      post :create, course: {title: 'Videography'}
      expect(response).to redirect_to root_path

      course=Course.last
      expect(course.title).to eq('Videography')
      expect(course.user).to eq(user)
    end
  end
end
