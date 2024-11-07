import ballerina/sql;

# Define the function to fetch books from the database
#
# + return - Books or error
public isolated function getBooks() returns Book[]|sql:Error {
    // Execute the query and return a stream of Book records.
    stream<Book, sql:Error?> resultStream = dbClient->query(getBooksQuery());

    // Check if the result is a stream of Book records.
    if resultStream is stream<Book> {
        return from Book book in resultStream
            select book;
    }

    // If there is an error, return an error message.
    return error("Error fetching books");
}

# Define the function to create book on the database
#
# + payload - Book data
# + return - Query execution result or error
public isolated function insertBook(BookCreate payload) returns sql:ExecutionResult|sql:Error {
    return dbClient->execute(insertBookQuery(payload));
}

# Define the function to delete book from the database
#
# + bookId - Book Id
# + return - Query execution result or error
public isolated function deleteBook(int bookId) returns sql:ExecutionResult|sql:Error {
    return dbClient->execute(deleteBookQuery(bookId));
}

# Define the function to update book
#
# + bookId - Book Id  
# + payload - Book data
# + return - Query execution result or error
public isolated function updateBook(int bookId, BookUpdate payload) returns sql:ExecutionResult|sql:Error {
    return dbClient->execute(updateBookQuery(bookId, payload));
}
