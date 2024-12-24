package services;



import model.Book;

import java.util.ArrayList;
import java.util.List;

public class BookService {

    private static List<Book> bookList = new ArrayList<>();


    public static void addBook(Book book) {
        bookList.add(book);
    }

    public static void deleteBook(String isbn) {

        bookList.removeIf(book -> book.getIsbn().equals(isbn));

    }


    public static void updateBook(String isbn, String name) {
        for (Book book : bookList) {
            if (book.getIsbn().equals(isbn)) {
                book.setName(name);
                break;
            }
        }
    }


    public static List<Book> getAllBooks() {
        return bookList;
    }
}
