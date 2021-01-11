# frozen_string_literal: true

require 'application_system_test_case'


class SessionsTest < ApplicationSystemTestCase
  test 'should not login user with invalid credentials' do
    visit root_path
    fill_in 'Email', with: 'new@ya.ru'
    fill_in 'Пароль', with: 'new'
    click_on 'Войти'
    assert_text 'Email or password is invalid'
  end

  test 'register log in and log out' do
    login = 'testemail@email.com'
    password = 'testpass'

    visit signup_url

    fill_in 'Email', with: login
    fill_in 'Пароль', with: password
    fill_in 'Подтверждение пароля', with: password
    click_on 'Создать'

    assert_text 'User was successfully created.'

    fill_in 'Email', with: login
    fill_in 'Пароль', with: password
    click_on 'Войти'
    assert_text 'Logged in'

    click_on 'Выйти'
    assert_text 'Logged out'
  end

  test 'register login and logout' do
    login = 'testemail@email.com'
    password = 'testpass'

    visit signup_url

    fill_in 'Email', with: login
    fill_in 'Пароль', with: password
    fill_in 'Подтверждение пароля', with: password
    click_on 'Создать'

    fill_in 'Email', with: login
    fill_in 'Пароль', with: password
    click_on 'Войти'

    assert_text 'Logged in'

    click_on 'Выйти'
    assert_text 'Logged out'
  end

  test 'register login and book' do
    login = 'testemail@email.com'
    password = 'testpass'

    visit signup_url

    fill_in 'Email', with: login
    fill_in 'Пароль', with: password
    fill_in 'Подтверждение пароля', with: password
    click_on 'Создать'

    fill_in 'Email', with: login
    fill_in 'Пароль', with: password
    click_on 'Войти'

    click_on 'Записаться'
    fill_in 'Имя', with: "Николай"
    fill_in 'Фамилия', with: "Соболев"
    click_on 'Записаться'

    click_on 'Записаться'
    fill_in 'Имя', with: "Николай"
    fill_in 'Фамилия', with: "Соболев"
    click_on 'Записаться'

    assert_text 'Вы уже записались на это выступление'
  end
end
