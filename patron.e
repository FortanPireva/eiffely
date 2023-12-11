class
    PATRON

create
    make

feature {NONE}

    make (a_name: V_STRING; a_id: V_STRING)
			-- Initialization
		note
			status: creator
		do
			name := a_name
			ID := a_id
		ensure
			name_set: name ~ a_name
			id_set: id ~ a_id
		end

feature -- Status

	name: V_STRING
		-- Name of the current patron

	ID: V_STRING
		-- Identification number

	checked_out_books_count: INTEGER
		-- Number of books borrowed by the current patron

feature -- Operations

	set_checked_out_books_count (a_count: INTEGER)
		-- Set `checked_out_books_count' to `a_count'
		do
			checked_out_books_count := a_count
		ensure
			checked_out_books_count = a_count
		end

	check_out_book (a_book: BOOK)
			-- Check out `a_book'
		note
			explicit: wrapping
		require
			a_book.is_available
		do
			a_book.check_out (Current)
			set_checked_out_books_count (checked_out_books_count + 1)
		ensure
			modify (Current, a_book)
    	    -- checked_out_books_count = old checked_out_books_count + 1
			-- Task11: add postconditions for the routine `PATRON.check_out_book'
		end

	return_book (a_book: BOOK)
			-- Return `a_book'
		note
			explicit: wrapping
		require
			valid_checked_out_book: (not a_book.is_available)
            valid_patron: a_book.patron /= Void
		local
			i: INTEGER
		do
			-- Task12: complete implementation for the routine `PATRON.return_book'
    		set_checked_out_books_count (checked_out_books_count - 1)
            a_book.return_book
		ensure
			modify (Current, a_book)
			book_returned: a_book.is_available
			checked_out_books_count = old checked_out_books_count - 1
		end

end