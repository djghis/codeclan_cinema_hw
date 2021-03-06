require_relative("../db/sql_runner")

class Customer

  attr_accessor :name, :funds
  attr_reader :id


  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end


  def save()
      sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
      values = [@name, @funds]
      customer = SqlRunner.run(sql, values).first
      @id = customer['id'].to_i
  end

    def update()
      sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
      values = [@name, @funds, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films_seen()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id  = films.id WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map{|film| Film.new(film)}

  end

  def films_count()
    films = self.films_seen()
     films.count
  end


def buying_ticket()
  tickets = self.films_seen
   all_tickets = tickets.map {|ticket| ticket.price}
   sum_of_tickets = all_tickets.sum
    left_funds= @funds -= sum_of_tickets
   self.update
   return left_funds

end

  # def buying_ticket()
  #   sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id  = films.id WHERE customer_id = $1"
  #   values = [@id]
  #   films = SqlRunner.run(sql, values)
  #   p tickets =  films.map{|film| Film.new(film)}
  #   all_tickets = tickets.map{|ticket| ticket.price}
  #    @funds -= all_tickets.sum
  #   self.update
  #   return @funds
  # end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map{|customer| Customer.new(customer)}
  end
  #
  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
