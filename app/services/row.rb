# frozen_string_literal: true

class Row
  def initialize(row)
    @row = row.split(' ')
  end

  def to_h
    {
      date: date,
      invoice: invoice,
      description: description,
      discount: discount,
      amount: amount,
      net: net
    }
  end

  def date
    day, month, year = @row[0].split('/')
    Date.new(year.to_i, day.to_i, month.to_i)
  end

  def invoice
    @row[1]
  end

  def description
    @row[2]
  end

  def discount
    decimal @row[3]
  end

  def amount
    decimal @row[4]
  end

  def net
    decimal @row[5]
  end

  private

  def decimal(string)
    string.sub('$', '').sub(',', '').to_f
  end
end
