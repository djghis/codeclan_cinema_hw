require_relative("../db/sql_runner")


class Film


  attr_accessor :title, :price, :show_time
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @title = options['title']
    @price = options['price'].to_i
    @show_time = options['show_time']
  end

  def save()
    sql = "INSERT INTO films (title, price, show_time) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @price, @show_time]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE  films SET (title, price, show_time) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @price,@show_time, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def customers_booked()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map{|customer| Customer.new(customer)}
  end

  def customer_count()
    customers = self.customers_booked()
     customers.count
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return films.map{|film| Film.new(film)}
  end

  def self.delete_all()
    sql = "DELETE From films"
    SqlRunner.run(sql)
  end


end
