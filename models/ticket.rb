require('pg')
require_relative('../db/sql_runner')

class Ticket
  attr_accessor :customer_id, :film_id
  attr_reader :id

  def initialize(options)
    @id = options ['id'].to_i
    @customer_id = options[customer_id].to_i
    @film_id = options[film_id].to_i
end



  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values)[0];
    @id = casting['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (customer_id, film_id, fee) = ($1, $2) WHERE id = $3"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * FROM tickets where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    movie = SqlRunner.run(sql, values).first
    return Film.new(film)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    star = SqlRunner.run(sql, values).first
    return Customer.new(customer)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    data = SqlRunner.run(sql)
    return data.map{|ticket| Ticket.new(ticket)}
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
