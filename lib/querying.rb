# selects all of the books titles and years in the first series and orders them chronologically      
def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year 
  FROM books JOIN series ON books.series_id = series.id
  WHERE series.id = 1
  GROUP BY books.year;"
end

# returns the name and motto of the character with the longest motto (FAILED - 2)
def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters ORDER BY(motto) ASC LIMIT 1;"
end


# determines the most prolific species of characters and return its value and count (FAILED - 3)
def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) FROM characters GROUP BY species ORDER BY species DESC LIMIT 1;"
end


# selects the authors names and their series' subgenres (FAILED - 4)
def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM series 
  INNER JOIN authors ON series.author_id = authors.id
  JOIN subgenres ON subgenres.id = series.subgenre_id;"
end


# selects the series title with the most characters that are the species "human"
def select_series_title_with_most_human_characters
  "SELECT series.title 
  FROM series
  JOIN books ON books.series_id = series.id
  JOIN character_books ON character_books.book_id = books.id
  JOIN characters ON character_books.character_id = characters.id
  WHERE characters.species = 'human'
  GROUP BY series.title
  ORDER BY COUNT(*) DESC LIMIT 1;"
end


# selects all of the character names and the number of books they have appeared in, grouped by character name, 
# in descending order by number of books and ascending order by character name
def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(*) AS book_count
  FROM character_books
  JOIN characters ON character_books.character_id = characters.id
  GROUP BY characters.name
  ORDER BY book_count DESC, characters.name;"
end
