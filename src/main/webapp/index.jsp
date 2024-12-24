<!DOCTYPE html>
<html>
<head>
    <title>Book Management System</title>
    <script>
        function loadBooks() {
            fetch('/books')
                .then(response => response.json())
                .then(data => {
                    let bookList = document.getElementById('bookList');
                    bookList.innerHTML = "";
                    data.forEach(book => {
                        let li = document.createElement('li');
                        li.textContent =  "BookName:"+book.name+"(ISBN:"+book.isbn+")";
                        bookList.appendChild(li);
                    });
                })
                .catch(error => console.error('Error fetching books:', error));
        }

        function addBook() {
            let name = document.getElementById('bookName').value;
            let isbn = document.getElementById('bookIsbn').value;
            if (name && isbn) {
                fetch('/books', {
                    method: 'POST',
                    body: new URLSearchParams({ name: name, isbn: isbn }),
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
                })
                    .then(() => {
                        loadBooks();
                        document.getElementById('bookName').value = '';
                        document.getElementById('bookIsbn').value = '';
                    })
                    .catch(error => console.error('Error adding book:', error));
            } else {
                alert("Please fill in both the book name and ISBN.");
            }
        }

        function deleteBook() {
            let isbn = document.getElementById('deleteIsbn').value;
            if (isbn) {
                fetch("/books?isbn="+isbn, { method: 'DELETE' })
                    .then(() => {
                        loadBooks();
                        document.getElementById('deleteIsbn').value = '';
                    })
                    .catch(error => console.error('Error deleting book:', error));
            } else {
                alert("Please enter an ISBN to delete.");
            }
        }

        function updateBook() {
            let isbn = document.getElementById('updateIsbn').value;
            let name = document.getElementById('updateName').value;
            if (isbn && name) {
                fetch("/books?isbn="+isbn+"&name="+name, { method: 'PUT' })
                    .then(() => {
                        loadBooks();
                        document.getElementById('updateIsbn').value = '';
                        document.getElementById('updateName').value = '';
                    })
                    .catch(error => console.error('Error updating book:', error));
            } else {
                alert("Please fill in both ISBN and the new book name.");
            }
        }
    </script>
</head>
<body onload="loadBooks()">

<h1>Book Management System</h1>

<h3>Add Book</h3>
<form onsubmit="addBook(); return false;">
    <input type="text" id="bookName" placeholder="Book Name" required>
    <input type="text" id="bookIsbn" placeholder="ISBN" required>
    <button type="submit">Add Book</button>
</form>

<h3>Delete Book</h3>
<form onsubmit="deleteBook(); return false;">
    <input type="text" id="deleteIsbn" placeholder="ISBN to Delete" required>
    <button type="submit">Delete Book</button>
</form>

<h3>Update Book</h3>
<form onsubmit="updateBook(); return false;">
    <input type="text" id="updateIsbn" placeholder="ISBN to Update" required>
    <input type="text" id="updateName" placeholder="New Book Name" required>
    <button type="submit">Update Book</button>
</form>

<h3>Registered Books</h3>
<ul id="bookList"></ul>

</body>
</html>
