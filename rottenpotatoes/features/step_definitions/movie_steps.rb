# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
     Movie.create!(movie)
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  step %Q{I should see "#{title}"}
  step %Q{I should see "#{director}"}
end

