defmodule GraphqlTest.AnimalResolver do
  def all(_args, _info) do
    {:ok, GraphqlTest.Repo.all(GraphqlTest.Animal)}
  end

  def find(%{id: id}, _info) do
    case GraphqlTest.Repo.get(GraphqlTest.Animal, id) do
      nil  -> {:error, "Animal id #{id} not found"}
      animal -> {:ok, animal}
    end
  end
end
