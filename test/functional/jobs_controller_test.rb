require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job" do
    Timecop.freeze
    @foo = Job.new
    assert_difference('Job.count') do
      @foo.jobname = "CR's new job"
      @foo.description = 'Something'
      @foo.bid_due = Time.now.localtime + 1.hour + 1.second
      @foo.delivery_due = Time.now.localtime + 2.days
      post :create, job: @foo.attributes
    end

    assert_redirected_to jobs_path
    Timecop.return
  end

  test "should show job" do
    get :show, id: @job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job
    assert_response :success
  end

  test "should update job" do   
    put :update, id: @job.to_param, job: @job.attributes
    assert_redirected_to jobs_path
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete :destroy, id: @job
    end

    assert_redirected_to jobs_path
  end
end