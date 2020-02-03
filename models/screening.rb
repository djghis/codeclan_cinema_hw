require_relative("../db/sql_runner")

class Screening

  attr_accessor :customer_id, :film_id, :film_title, :film_show_time
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']
    # @film_title = options['film_title']
    # @film_show_time = options['film_show_time']

  end

  # def save()
  #   sql = "INSERT INTO screenings (customer_id, film_id ) VALUES ($1,$2) RETURNING id"
  #   values = [@customer_id, @film_id]
  #   screenning = SqlRunner.run(sql, values).first
  #   @id = screenning['id'].to_i
  # end
  #
  # def update
  #   sql = "UPDATE screenings SET (customer_id, film_id) = ($1, $2) WHERE id = $3"
  #   values = [@customer_id, @film_id, @id]
  #   SqlRunner.run(sql, values)
  # end
  def save()
    sql = "INSERT INTO screenings (customer_id, film_id, film_title, film_show_time ) VALUES ($1,$2, $3, $4) RETURNING id"
    values = [@customer_id, @film_id]
    screenning = SqlRunner.run(sql, values).first
    @id = screenning['id'].to_i
  end

  def update
    sql = "UPDATE screenings SET (customer_id, film_id, film_title, film_show_time) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def popular_show
    sql = "SELECT tickets.* FROM tickets INNER JOIN screenings ON tickets.film_id = film.id WHERE film_title = $1 "
    values[@title]
    films = SqlRunner.run(sql, values)
    return films.map{|film| Screening.new(film)}

  end


  def self.all
    sql = "SELECT * FROM  screenings"
    screenings = SqlRunner.run(sql)
    return screenings.map{|screening| Screening.new(screening)}
  end


  def self.delete_all
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end
end
