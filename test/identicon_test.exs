defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  defp banana_hash, do: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]

  test "generate hash" do
    assert Identicon.hash_input("banana") == %Identicon.Image{hex: banana_hash()}
  end

  test "pick color from a hash" do
    image = %Identicon.Image{hex: banana_hash()}
    new_image = Identicon.pick_color(image)

    refute image == new_image

    assert length(new_image.hex) == 3
  end
end
