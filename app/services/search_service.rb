# frozen_string_literal: true

class SearchService

  def initialize
    @results = []
    @term = Search.last.try(:term)
  end

  def self.query
    new.query
  end

  def query
    return [] unless @term.present?

    if string_search
      search_strings
    else
      numeric_search
    end
    results
  end

  private

  def string_search
    @term.match(/^[[:alpha:][:blank:]]+$/).present?
  end

  def search_strings
    customers
    payments
  end

  def customers
    query = Customer.where("name ILIKE ?", "%#{@term}%")
    @results << query.map { |c| c.payments }.flatten.map { |p| p }.uniq
  end

  def payments
    Payment.in_batches.each_record do |record|
      %i(date report_date report_name page code description).each do |attr|
        @results << record if match?(record,attr)
      end
    end
  end

  def numeric_search
    Line.in_batches.each_record do |record|
      %i(date invoice description discount amount net).each do |attr|
        @results << record.payment if match?(record,attr)
      end
    end
  end

  def match?(record,attr)
    record.send(attr).to_s.include?(@term)
  end

  def results
    @results.flatten.uniq
  end
end
