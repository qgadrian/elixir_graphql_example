defmodule GraphqlTest.AnimalView do
  use GraphqlTest.Web, :view

  def render("index.json", %{animals: animals}) do
    %{data: render_many(animals, GraphqlTest.AnimalView, "animal.json")}
  end

  def render("show.json", %{animal: animal}) do
    %{data: render_one(animal, GraphqlTest.AnimalView, "animal.json")}
  end

  def render("animal.json", %{animal: animal}) do
    %{id: animal.id,
      name: animal.name,
      info: animal.info,
      birth_date: animal.birth_date}
  end
end
