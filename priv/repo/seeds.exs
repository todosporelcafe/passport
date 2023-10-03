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
bars = [

  %SpecialtyBar{
    name: "Babüin Café",
    address: "C. Bajío 303, Roma Sur, Cuauhtémoc, 06760 Ciudad de México, CDMX, México",
    description: "ace en los momentos más inesperados y por las conexiones humanas que enriquecen nuestra existencia.",
    instagram: "https://www.instagram.com/babuincafe/",
    tiktok: "https://www.instagram.com/babuincafe/",
    facebook: "https://www.facebook.com/babuincafe"
  },

  %SpecialtyBar{
    name: "Bar2 Name",
    address: "Bar2 Address",
    description: "Bar2 Description",
    instagram: "bar2_instagram",
    tiktok: "bar2_tiktok",
    facebook: "bar2_facebook"
  },

  %SpecialtyBar{
    name: "Bar3 Name",
    address: "Bar3 Address",
    description: "Bar3 Description",
    instagram: "bar3_instagram",
    tiktok: "bar3_tiktok",
    facebook: "bar3_facebook"
  }



  ]

Enum.each(bars, &Repo.insert!(&1))
