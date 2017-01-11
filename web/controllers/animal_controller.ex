defmodule GraphqlTest.AnimalController do
  use GraphqlTest.Web, :controller

  alias GraphqlTest.Animal

  def index(conn, _params) do
    animals = Repo.all(Animal)
    render(conn, "index.json", animals: animals)
  end

  def create(conn, %{"animal" => animal_params}) do
    changeset = Animal.changeset(%Animal{}, animal_params)

    case Repo.insert(changeset) do
      {:ok, animal} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", animal_path(conn, :show, animal))
        |> render("show.json", animal: animal)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(GraphqlTest.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    animal = Repo.get!(Animal, id)
    render(conn, "show.json", animal: animal)
  end

  def update(conn, %{"id" => id, "animal" => animal_params}) do
    animal = Repo.get!(Animal, id)
    changeset = Animal.changeset(animal, animal_params)

    case Repo.update(changeset) do
      {:ok, animal} ->
        render(conn, "show.json", animal: animal)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(GraphqlTest.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    animal = Repo.get!(Animal, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(animal)

    send_resp(conn, :no_content, "")
  end
end
