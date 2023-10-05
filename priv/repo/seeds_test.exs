alias Passport.Tour.SpecialtyBar

defmodule SeedTest do

  def read_file() do
    File.read!("specialty_bars_info.csv")
    |> String.split("\r", trim: true)
    |> Enum.map(&String.split(&1, "|"))
    |> Enum.map(fn list = [name, addres, description, instagram, tiktok, facebook] ->

      IO.inspect list
      end)
  end

end

sometest = SeedTest.read_file()
#IO.inspect sometest
