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

Repo.delete_all SpecialtyBar
Repo.insert! %SpecialtyBar{ name: "Cafe Galeno" }
