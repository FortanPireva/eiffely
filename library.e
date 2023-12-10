class
    LIBRARY

create
	make

feature {NONE}

	make
			-- Initialize a library
		note
			status: creator
		do
			create books.make_empty
		ensure
			books_empty: books.count = 0
		end

feature -- Status

	books: SIMPLE_ARRAY [BOOK]
			-- A list of books in the library

feature -- Operations

	add_book (a_new_book: BOOK)
			-- Add a new book to the library
		require
			not books.sequence.has (a_new_book)
			books.is_wrapped
		do
			books.force (a_new_book, books.count + 1)
		ensure
			modify ([Current, books])
			-- Task6: add postconditions for the routine `LIBRARY.add_book'
		end

	search_book_isbn (a_isbn: V_STRING): INTEGER
			-- Search a book in the library based on ISBN
			-- Return the index of the book whose ISBN is `a_isbn''
		require
			-- Task7: add a precondition for routine `LIBRARY.search_book_isbn'
			books.is_wrapped
		local
			i: INTEGER
		do
			from
				i := 1
				-- Task10: add loop invariants for the routine `LIBRARY.search_book_isbn'
			until
				i > books.count
			loop
				if books [i] /= Void and then books [i].isbn ~ a_isbn then
					Result := i
				end
				i := i + 1
				variant
					0
				-- Task8: add a loop variant for the routine `LIBRARY.search_book_isbn'

			end
		ensure
			-- Task9: add postconditions for the routine `LIBRARY.search_book_isbn'
		end

end

