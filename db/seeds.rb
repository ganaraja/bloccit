include RandomData

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end


50.times do
  Advertisement.create!(
      title: RandomData.random_sentence,
      copy: RandomData.random_paragraph,
      price: RandomData.random_price
  )
end

puts "Seed finished"

puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"

puts "Creating unique..."

Post.find_or_create_by!(
 title: "I am Unique title",
 body: "I am having Unique body"
            )
