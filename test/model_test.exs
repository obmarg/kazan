defmodule KazanModelTest do
  use ExUnit.Case, async: true

  alias Kazan.Models.Apimachinery.Meta.V1.{
    ObjectMeta
  }

  test "can encode a custom resource defined via defmodel" do
    assert FooResource.encode(%FooResource{
             an_int: 100,
             a_string: "hello",
             metadata: %ObjectMeta{name: "test-foo", namespace: "default"}
           }) ==
             {:ok,
              %{
                "a_string" => "hello",
                "an_int" => 100,
                "apiVersion" => "example.com/v1",
                "kind" => "Foo",
                "metadata" => %{"name" => "test-foo", "namespace" => "default"}
              }}
  end

  test "can decode a custom resource defined via defmodel" do
    assert FooResource.decode(%{
             "a_string" => "hello",
             "an_int" => 100,
             "apiVersion" => "example.com/v1",
             "kind" => "Foo",
             "metadata" => %{"name" => "test-foo", "namespace" => "default"}
           }) ==
             {:ok,
              %FooResource{
                an_int: 100,
                a_string: "hello",
                metadata: %ObjectMeta{name: "test-foo", namespace: "default"}
              }}
  end
end
