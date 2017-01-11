defmodule GraphqlTest.Schema do
  use Absinthe.Schema

  import_types GraphqlTest.Schema.Types

  query do
    @desc "Get all animals"
    field :animals, list_of(:animal) do
      resolve &GraphqlTest.AnimalResolver.all/2
    end

    @desc "Get an animal by its id"
    field :animal, type: :animal do
      arg :id, non_null(:id)
      resolve &GraphqlTest.AnimalResolver.find/2
    end
  end

end
