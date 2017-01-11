defmodule GraphqlTest.AnimalControllerTest do
  use GraphqlTest.ConnCase

  alias GraphqlTest.Animal
  @valid_attrs %{birth_date: %{day: 17, month: 4, year: 2010}, info: "some content", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, animal_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    animal = Repo.insert! %Animal{}
    conn = get conn, animal_path(conn, :show, animal)
    assert json_response(conn, 200)["data"] == %{"id" => animal.id,
      "name" => animal.name,
      "info" => animal.info,
      "birth_date" => animal.birth_date}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, animal_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, animal_path(conn, :create), animal: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Animal, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, animal_path(conn, :create), animal: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    animal = Repo.insert! %Animal{}
    conn = put conn, animal_path(conn, :update, animal), animal: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Animal, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    animal = Repo.insert! %Animal{}
    conn = put conn, animal_path(conn, :update, animal), animal: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    animal = Repo.insert! %Animal{}
    conn = delete conn, animal_path(conn, :delete, animal)
    assert response(conn, 204)
    refute Repo.get(Animal, animal.id)
  end
end
