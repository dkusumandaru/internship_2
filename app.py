from flask import Flask, render_template, request, url_for, redirect
from flask_mysqldb import MySQL

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'perpustakaan_db'
mysql = MySQL(app)

@app.route('/')
def home():


	return redirect(url_for('books'))
	
@app.route('/books')
def books():

	cur = mysql.connection.cursor()
	cur.execute("SELECT * FROM book_category")
	dataCategory = cur.fetchall()
	cur.close()


	cur = mysql.connection.cursor()
	cur.execute("SELECT * FROM book JOIN book_category ON book.category_id = book_category.category_id")
	dataBook = cur.fetchall()
	#return str(dataBook)
	cur.close()
	return render_template('books_list.html', dataBook=dataBook, dataCategory = dataCategory)


@app.route('/insert',methods=["POST"])
def insert_book():
	pass
	idCategory = request.form['idCategory']

	cur = mysql.connection.cursor()
	cur.execute("SELECT category_code FROM book_category WHERE category_id=%s", (idCategory))
	dataCategory = cur.fetchall()
	cur.close()

	n = 0
	codeCategory = ''
	[x[n] for x in dataCategory]
	for row in dataCategory:
		codeCategory = row[n]


	cur = mysql.connection.cursor()
	cur.execute("SELECT COUNT(category_id) FROM book WHERE category_id=%s", (idCategory))
	dataIdBookCategory = cur.fetchall()
	cur.close()

	#return str(dataCategory);

	#return str(dataCategory)
	i = 0
	idBookCategory = 0
	[x[i] for x in dataIdBookCategory]
	for row in dataIdBookCategory:
		idBookCategory = row[n]		

	# cur = mysql.connection.cursor()
	# cur.execute("SELECT COUNT(category_id) FROM book WHERE category_id=%s", (idCategory))
	# idBookCategory = [v for v in cur.fetchone().values()][0]
	# cur.close()
 

	# for book_id in dataIdBookCategory:
	# 	idBookCategory = book_id.0
	idBookCategory = int(idBookCategory)

	if idBookCategory <= 9 or idBookCategory >= 0:
		codeZero = '00000000'

	elif idBookCategory <= 99 or idBookCategory >= 10:
		codeZero = '0000000'

	elif idBookCategory <= 999 or idBookCategory >= 100:
		codeZero = '000000'

	elif idBookCategory <= 9999 or idBookCategory >= 1000:
		codeZero = '00000'

	idBC = idBookCategory+1

	idBook = codeCategory + codeZero + str(idBC) 
	nameBook = request.form['nameBook']
	authorBook = request.form['authorBook']
	releaseBook = request.form['releaseBook']
	publisherBook = request.form['publisherBook']

	cur = mysql.connection.cursor()
	cur.execute("INSERT INTO book (book_id, book_name, book_author, book_release, book_publisher, category_id) VALUES (%s, %s, %s, %s, %s, %s)",(idBook, nameBook, authorBook, releaseBook, publisherBook, idCategory))
	mysql.connection.commit()
	return redirect(url_for('books'))


@app.route('/update_book', methods=["POST"])
def update_book():
	idBook = request.form['idBook']
	nameBook = request.form['nameBook']
	authorBook = request.form['authorBook']
	releaseBook = request.form['releaseBook']
	publisherBook = request.form['publisherBook']
	publisherBook = request.form['publisherBook']
	cur = mysql.connection.cursor()
	cur.execute("UPDATE book SET book_name = %s, book_author = %s, book_release = %s, book_publisher = %s WHERE book_id=%s ",(nameBook, authorBook, releaseBook, publisherBook, idBook))
	mysql.connection.commit()
	return redirect(url_for('books'))


@app.route('/delete_book/<string:idBook>', methods=["GET"])
def delete_book(idBook):
	cur = mysql.connection.cursor()
	cur.execute("DELETE FROM book WHERE book_id=%s", (idBook,))
	mysql.connection.commit()
	return redirect(url_for('books'))


@app.route('/hello')
def hello():
	pass

	cur.execute("SELECT  FROM book_category")
	dataCategory = cur.fetchall()
	return


@app.route('/categories')
def categories():
	cur = mysql.connection.cursor()
	cur.execute("SELECT * FROM book_category")
	dataCategory = cur.fetchall()
	cur.close()
	return render_template('categories_list.html', data=dataCategory)

@app.route('/insert_category', methods=["POST"])
def insert_category():
	codeCategory = request.form['codeCategory']
	namaCategory = request.form['namaCategory']
	cur = mysql.connection.cursor()
	cur.execute("INSERT INTO book_category (category_name, category_code) VALUES (%s, %s)",(namaCategory, codeCategory,))
	mysql.connection.commit()
	return redirect(url_for('categories'))

@app.route('/update_category', methods=["POST"])
def update_category():
	idCategory = request.form['idCategory']
	nameCategory = request.form['nameCategory']
	cur = mysql.connection.cursor()
	cur.execute("UPDATE book_category SET category_name=%s WHERE category_id=%s", (nameCategory, idCategory,))
	mysql.connection.commit()
	return redirect(url_for('categories'))

@app.route('/delete_category/<string:idCategory>', methods=["GET"])
def delete_category(idCategory):
	cur = mysql.connection.cursor()
	cur.execute("DELETE FROM book_category WHERE category_id=%s", (idCategory,))
	mysql.connection.commit()
	return redirect(url_for('categories'))

if __name__ == '__main__':
	app.run(debug=True)