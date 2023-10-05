# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Passport.Repo.insert!(%Passport.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
alias Passport.Repo
alias Passport.Tour.SpecialtyBar


File.read!("specialty_bars_info.csv")
|> String.split("\r", trim: true)
|> Enum.map(&String.split(&1, "|"))
|> Enum.map(fn list = [name, addres, description, instagram, tiktok, facebook] ->
  Repo.insert!(%SpecialtyBar{
    name: name,
    address: addres,
    description: description,
    instagram: instagram,
    tiktok: tiktok,
    facebook: facebook
  })
end)




