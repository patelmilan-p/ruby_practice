event "sky is falling" do
  @sky_height < 300
end

event "it's getting closer" do
  @sky_height < @mountain_height
end

setup do
  puts "setting up sky"
  @sky_height = 100
end

setup do
  puts "setting up mountain"
  @mountain_height = 200
end
