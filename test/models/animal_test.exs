defmodule GraphqlTest.AnimalTest do
  use GraphqlTest.ModelCase

  alias GraphqlTest.Animal

  @valid_attrs %{birth_date: %{day: 17, month: 4, year: 2010}, info: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Animal.changeset(%Animal{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Animal.changeset(%Animal{}, @invalid_attrs)
    refute changeset.valid?
  end
end
