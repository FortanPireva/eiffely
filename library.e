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
            books_increment: books.count = old books.count + 1
		end

	search_book_isbn (a_isbn: V_STRING): INTEGER
			-- Search a book in the library based on ISBN
			-- Return the index of the book whose ISBN is `a_isbn''
		require
			-- Task7: add a precondition for routine `LIBRARY.search_book_isbn'
            a_isbn /= Void
            books.count > 0
            books.is_wrapped
            across 1 |..| books.count  as j all books [j] /= Void end
		local
			i: INTEGER
		do
			from
				i := 1
				-- Task10: add loop invariants for the routine `LIBRARY.search_book_isbn'
            invariant 
                in_range: i >= 1 and  i <= books.count + 1
                if_found_result_true: Result <= books.count and Result > 0 implies books[Result] /= Void and books[Result].isbn ~ a_isbn
			until
				i > books.count
			loop
				if books [i] /= Void and then books [i].isbn ~ a_isbn then
					Result := i
				end
				i := i + 1
				variant
    			-- Task8: add a loop variant for the routine `LIBRARY.search_book_isbn'
				   decrement: books.count - i
                
			end
		ensure
			-- Task9: add postconditions for the routine `LIBRARY.search_book_isbn'
            valid_result: Result <= books.count and Result > 0 implies books[Result] /= Void and books[Result].isbn ~ a_isbn		
        end
end

