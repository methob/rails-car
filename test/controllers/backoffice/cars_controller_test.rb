require 'test_helper'

class Backoffice::CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backoffice_car = backoffice_cars(:one)
  end

  test "should get index" do
    get backoffice_cars_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_car_url
    assert_response :success
  end

  test "should create backoffice_car" do
    assert_difference('Backoffice::Car.count') do
      post backoffice_cars_url, params: { backoffice_car: { ano: @backoffice_car.ano, cor: @backoffice_car.cor, marca: @backoffice_car.marca, modelo: @backoffice_car.modelo } }
    end

    assert_redirected_to backoffice_car_url(Backoffice::Car.last)
  end

  test "should show backoffice_car" do
    get backoffice_car_url(@backoffice_car)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_car_url(@backoffice_car)
    assert_response :success
  end

  test "should update backoffice_car" do
    patch backoffice_car_url(@backoffice_car), params: { backoffice_car: { ano: @backoffice_car.ano, cor: @backoffice_car.cor, marca: @backoffice_car.marca, modelo: @backoffice_car.modelo } }
    assert_redirected_to backoffice_car_url(@backoffice_car)
  end

  test "should destroy backoffice_car" do
    assert_difference('Backoffice::Car.count', -1) do
      delete backoffice_car_url(@backoffice_car)
    end

    assert_redirected_to backoffice_cars_url
  end
end
