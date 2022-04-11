require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

    def setup
        @user = users(:arseny)
        @micropost = @user.micropost.build(content: "Lorem ipsum")
    end

    test "should be valid" do
        assert @micropost.valid?
    end

    test "user id should be present" do
        @micropost.user_id = nil
        assert_no @micropost.valid?
    end
end