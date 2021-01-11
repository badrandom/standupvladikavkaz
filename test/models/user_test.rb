require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should save to db' do
    user = User.new(email: 'testing@ya.ru', password: '1111', is_admin: false)
    assert user.save
    user.delete
  end

  test 'check adding not unique email' do
    first = User.new(email: 'test@mail.ru', password: '1111', is_admin: false)
    first.save
    second = User.new(email: 'test@mail.ru', password: '1111', is_admin: false)
    second.validate
    assert_equal ['уже существует'], second.errors[:email]
  end

  test 'should get added data from db' do
    user = User.new(email: 'evgeniy@mail.ru', password: '1111', is_admin: false )
    user.save
    assert_equal  'evgeniy@mail.ru', User.find_by_email('evgeniy@mail.ru').email
  end

  
end
