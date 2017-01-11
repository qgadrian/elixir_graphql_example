# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs

# Seed only will be allowed on safe environments
if Mix.env == :dev || Mix.env == :test do
  GraphqlTest.Repo.insert!(%GraphqlTest.Animal{
    name: "animal_1",
    info: "animal 1 information",
    birth_date: Ecto.DateTime.from_erl(:erlang.localtime)
  })

  GraphqlTest.Repo.insert!(%GraphqlTest.Animal{
    name: "animal_2",
    info: "animal 2 information",
    birth_date: Ecto.DateTime.from_erl(:erlang.localtime)
  })

  GraphqlTest.Repo.insert!(%GraphqlTest.Animal{
    name: "animal_3",
    info: "animal 3 information",
    birth_date: Ecto.DateTime.from_erl(:erlang.localtime)
  })
end
