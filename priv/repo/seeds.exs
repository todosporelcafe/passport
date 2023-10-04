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
    description: "iAMARGO es una barra de café de autor, enfocada en posicionar a productores mexicanos y en todos lo insumos que usamos, buscando siempre la trazabilidad, que sea el mas cercano así como también pagar un precio justo quitando intermediarios. Tuvo sus origenes hace 6 años en la colonia Roma una barra muy pequeñita con una carta reducida pero con la mejor calidad y variedade de café, fue creado por la pasión de entender los procesos y llegar a lo más profundo de esta pasión. En 2021 como consecuencía de pandemía varias emperesas aliadas nos unimos y abrimos las puertas en la actual ubicación creando una fusión de AMARGO BARRA DE ESPECIALIDAD y CONINA AMARGA haciendo maridajes y apoyandonos en ella para llegar a más publico potencial. Actualmente hacemos eventos culturales en torno al café como catas, exposiciones, conferencias etc. pero también al contra con Ludoteca y áreas divididas para diferentes fines se han hecho bazares para comprar directo con poductor, aventos para niños, cursos de verano, entre otros. NUESTRA FILOSOFÍA es siempre vender calidad y salud haciendo la mayoria de los procesos internamente asi asegurar el comensal lleve a su cuerpo alimentos libres de grasas trans, aglutinantes y plásticos alimenticios NO SE TIENE QUE SER VERDE PARA SER SALUDABLE ... siempre ser trasparentes, ser nuestra palabra, ayudar a superarnos en conjunto y extender la mano si alguien lo necesita.",
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
