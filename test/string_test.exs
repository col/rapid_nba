defmodule RapidNba.StringTest do
  use ExUnit.Case
  alias RapidNba.String

  test "camelize string" do
    assert String.camelize("first_name") == "firstName"
  end

  test "camelize atom" do
    assert String.camelize(:first_name) == "firstName"
  end
end