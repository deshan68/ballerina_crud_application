import ballerina/sql;

type DatabaseConfig record {|
    # User of the database
    string user;
    # Password of the database
    string password;
    # Name of the database
    string database;
    # Host of the database
    string host;
    # Port
    int port;
|};

# Book record type.
public type Book record {|
    # Book ID
    @sql:Column {name: "id"}
    readonly int id;

    # Book title
    @sql:Column {name: "title"}
    string title;

    # Book author
    @sql:Column {name: "author"}
    string author;

    # Book published year
    @sql:Column {name: "published_year"}
    string publishedYear;

    # Book genre
    @sql:Column {name: "genre"}
    string genre;

    # Book price
    @sql:Column {name: "price"}
    string price;

    # Book quantity
    @sql:Column {name: "quantity"}
    string quantity;
|};

# Book create record type.
public type BookCreate record {|
    # Book title
    string title;
    # Book author
    string author;
    # Book published year
    string publishedYear;
    # Book genre
    string genre;
    # Book price
    decimal price;
    # Book quantity
    int quantity;
|};

# Book update record type.
public type BookUpdate record {|
    # Book title
    string? title = ();
    # Book author
    string? author = ();
    # Book published year
    string? publishedYear = ();
    # Book genre
    string? genre = ();
    # Book price
    decimal? price = ();
    # Book quantity
    int? quantity = ();
|};

