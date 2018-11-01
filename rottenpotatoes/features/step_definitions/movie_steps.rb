# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
     Movie.create!(movie)
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  regexp = /#{e1}.+#{e2}/m
  page.body.should =~  regexp
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  ratings = rating_list.split(%r{,\s*})
  #   iterate over the ratings and reuse the "When I check..." or
  ratings.each do |r|
    if uncheck
        step "I uncheck #{r}"
    else
        step "I check #{r}"
    end
  end
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

Then /I should see all the movies/ do
  movies = Movie.all
#  movies.each do |movie|
#    assert page.body =~ /#{movie.title}/, "Missing #{movie.title} "
#  end
end
Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  step %Q{I should see "#{title}"}
  step %Q{I should see "#{director}"}
end

