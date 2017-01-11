defmodule GraphqlTest.Schema.Types do
  use Absinthe.Schema.Notation

  object :animal do
    field :id, :id, description: "The id of the animal"
    field :name, :string, description: "The name of the animal"
    field :info, :string, description: "The bio of the animal"
    field :birth_date, :time, description: "The approximated birth date of the animal"
  end

  @desc """
  The `Time` scalar type represents time values provided in the ISO 8601 datetime format.
  """
  scalar :time, description: "ISOz time" do
    parse &Timex.Parse.DateTime.Parser.parse(&1.value, "{ISO:Extended}")
    serialize &Timex.Format.DateTime.Formatter.format!(&1, "{ISO:Extended}")
  end

end
