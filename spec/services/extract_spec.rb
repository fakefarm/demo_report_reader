# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Extract do
  before(:all) do
    file = 'spec/fixtures/files/example_remit.png'
    @extract = Extract.new(file)
    @extract.convert
  end

  let(:company) { 'The Rabco Corporation' }
  let(:report_name) { 'Accounts Payable Payment Report' }
  let(:date) { @extract.date }
  let(:report_date) { '3/11/2016' }
  let(:report_page) { 'Page 1' }
  let(:code) { '3/11/6 FNBMDCK 541818' }
  let(:description) { 'Date Invoice Description Discount Amount Net' }

  let(:to_h) do
    {
      date: date,
      report_date: report_date,
      report_name: report_name,
      page: report_page,
      code: code,
      description: description
    }
  end

  it 'convert' do
    expect(@extract.convert.class).to be(String)
  end

  it 'company' do
    expect(@extract.company).to eq(company)
  end

  it 'report_name' do
    expect(@extract.report_name).to eq(report_name)
  end

  it 'report_date' do
    expect(@extract.report_date).to eq(report_date)
  end

  it 'report_page' do
    expect(@extract.report_page).to eq(report_page)
  end

  it 'description' do
    expect(@extract.description).to eq(description)
  end

  it 'date' do
    expect(@extract.date.class).to eq(Date)
  end

  it 'lines' do
    expect(@extract.lines.count).to eq(30)
  end

  it 'to_h' do
    expect(@extract.to_h).to eq(to_h)
  end

  describe 'rows' do
    it 'array of rows' do
      expect(@extract.rows.first).to be_instance_of(Row)
    end
  end
end
