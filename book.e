class
    BOOK

create
	make

feature {NONE}

	make (a_title: V_STRING; a_author: V_STRING; a_isbn: V_STRING)
			-- Initialization of a book
		note
			status: creator
		do
			title := a_title
			author := a_author
			isbn := a_isbn
			is_available := True
		ensure
			-- Task1: add postconditions for routine `BOOK.make'
            is_available = True
            title = a_title
            author = a_author
            isbn = a_isbn
		end

feature -- Status

	title: V_STRING
			-- Title of the book

	author: V_STRING
			-- Name of the author

	isbn: V_STRING
			-- ISBN of the book

	is_available: BOOLEAN
			-- Is the book available?

	patron: detachable PATRON
			-- The patron of the book if it's checked out

feature -- Operations

	set_patron (a_patron: detachable PATRON)
			-- Set `patron' to `a_patron'.
		do
			patron := a_patron
		ensure
			modify_field (["closed", "patron"], Current)
			-- Task2: add a postcondition for routine `BOOK.set_patron'
            patron = a_patron
		end

	set_availability (b: BOOLEAN)
			-- Set `is_available' to `b'.
		do
			is_available := b
		ensure
			modify_field (["closed", "is_available"], Current)
			-- Task3: add a postcondition for routine `BOOK.set_availability'
            is_available = b
		end

	remove_patron
			-- Reset the patron of the book to `Void'.
		do
			patron := Void
		ensure
			modify_field (["closed", "patron"], Current)
			-- Task4: add a postcondition for routine `BOOK.remove_patron'
            patron = Void
		end

	check_out (a_patron: PATRON)
			-- Check out the current book
		note
			explicit: wrapping
		require
			is_available
		do
			set_patron (a_patron)
			set_availability (False)
		ensure
			modify_field (["closed", "is_available", "patron"], Current)
			checked_out: not is_available
			patron_set: patron = a_patron
		end

	return_book
			-- Return the current book
		note
			explicit: wrapping
		require
			not is_available and patron /= Void
		do
			-- Task5: complete the implementation for routine `BOOK.return_book' based on its postconditions
            
		ensure
			modify_field (["closed", "is_available", "patron"], Current)
			returned: is_available
			patron_void: patron = Void
		end

end

