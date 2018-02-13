defmodule Kazan.LineBufferTest do
  use ExUnit.Case
  alias Kazan.LineBuffer

  test "get_lines with nothing" do
    {lines, _buffer} =
       LineBuffer.new()
       |> LineBuffer.get_lines()
    assert [] == lines
  end

  test "get_lines when adding one chunk" do
    {lines, _buffer} =
      LineBuffer.new()
      |> LineBuffer.add_chunk("c1\n")
      |> LineBuffer.get_lines()
    assert ["c1"] == lines
  end

  test "get_lines when adding multiple chunks" do
    {lines, _buffer} =
      LineBuffer.new()
      |> LineBuffer.add_chunk("c1\nc2\n")
      |> LineBuffer.add_chunk("c3\nc4\n")
      |> LineBuffer.get_lines()
    assert ["c1", "c2", "c3", "c4"] == lines
  end

  test "get_lines when adding incomplete chunks" do
    {lines, _buffer} =
      LineBuffer.new()
      |> LineBuffer.add_chunk("c1\nc2\n")
      |> LineBuffer.add_chunk("c3\nc")
      |> LineBuffer.add_chunk("4\nc5\n")
      |> LineBuffer.get_lines()
    assert ["c1", "c2", "c3", "c4", "c5"] == lines
  end

  test "get_lines when in middle of incomplete chunks" do
    {lines, buffer} =
      LineBuffer.new()
      |> LineBuffer.add_chunk("c1\nc2\n")
      |> LineBuffer.add_chunk("c3\nc")
      |> LineBuffer.get_lines()
    assert ["c1", "c2", "c3"] == lines

    {lines, _buffer} =
      buffer
      |> LineBuffer.add_chunk("4\nc5\n")
      |> LineBuffer.get_lines()
    assert ["c4", "c5"] == lines
  end

  test "Add empty chunk" do
    {lines, _buffer} =
      LineBuffer.new()
      |> LineBuffer.add_chunk("c1\n")
      |> LineBuffer.add_chunk("")
      |> LineBuffer.get_lines()
    assert ["c1"] == lines
  end

  test "Add just cr chunk" do
    {lines, _buffer} =
      LineBuffer.new()
      |> LineBuffer.add_chunk("c1")
      |> LineBuffer.add_chunk("\n")
      |> LineBuffer.get_lines()
    assert ["c1"] == lines
  end
end
