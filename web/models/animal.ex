defmodule GraphqlTest.Animal do
  use GraphqlTest.Web, :model

  schema "animals" do
    field :name, :string
    field :info, :string
    field :birth_date, Ecto.Date

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :info, :birth_date])
    |> validate_required([:name, :info, :birth_date])
  end
end
