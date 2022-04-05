# defmodule ID3Parser do
#   def parse(file_name) do
#     case File.read(file_name) do
#       {:ok, mp3} ->
#         mp3_byte_size = byte_size(mp3) - 128
#         << _ :: binary-size(mp3_byte_size), id3_tag :: binary >> = mp3
#         << "TAG", title :: binary-size(30),
#                   artist :: binary-size(30)
#                   album :: binary-size(30)
#                   year :: binary-size(4)
#                   _rest :: binary >> = id3_tag
        
#         IO.puts "#{artist} - #{title} (#{album}, #{year})"

#       _ ->
#         IO.puts "Could not open #{file_name}"
#     end
#   end
# end

defmodule ID3Parser do
  def parse(file_name) do
    case File.read(file_name) do
      {:ok, mp3} ->
        mp3_byte_size = byte_size(mp3) - 128
        << _ :: binary-size(mp3_byte_size), id3_tag :: binary >> = mp3
        << "TAG", title :: binary-size(30), artist :: binary-size(30), album :: binary-size(30), year :: binary-size(4), _rest :: binary >> = id3_tag
        IO.puts title
        IO.puts artist 
        IO.puts album 
        IO.puts year 

      _ ->
        IO.puts "Could not open #{file_name}"
    end
  end
end

ID3Parser.parse("sample-song.mp3")