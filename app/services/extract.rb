# frozen_string_literal: true

class Extract
  def initialize(file, worker: RTesseract, row: Row)
    @file = file
    @worker = worker
    @row = row
    run
  end

  def run
    convert
    self
  end

  def to_h
    {
      date: date,
      report_date: report_date,
      report_name: report_name,
      page: report_page,
      code: code,
      description: description
    }
  end

  def import
    @import ||= @worker.new(@file)
  end

  def convert
    @convert ||= import.to_s
  end

  def page
    convert.split("\n")
  end

  def header
    page[0..5]
  end

  def body
    page[6..]
  end

  def lines
    body.select { |bling| bling.include?('$') }
  end

  def rows
    lines.map { |line| @row.new(line) }
  end

  def company
    header[0].split[0..2].join(' ')
  end

  def date
    @month, @day, @year = header[0].split(' ')[-1].split('/')
    Date.new(@year.to_i, @day.to_i, @month.to_i)
  end

  def report_name
    header[0].split[3..6].join(' ')
  end

  def report_page
    header[1]
  end

  def code
    header[3]
  end

  def report_date
    date
    "#{@month}/#{@day}/#{@year}"
  end

  def description
    header[5]
  end
end
