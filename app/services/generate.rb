# frozen_string_literal: true

class Generate
  OFFSET_X = 10
  OFFSET_Y = 10
  PAGE_X = 612
  PAGE_Y = 792
  DRAW_POINT_SIZE = 15
  IMAGE_BACKGROUND_COLOR = '#eee'
  DRAW_STROKE = '#600'
  DRAW_FILL = 'white'
  DRAW_UNDERCOLOR = 'black'
  FILE_NAME = 'tmp.png'

  def initialize(upload_id, payment: Payment, upload: Upload)
    @upload_id = upload_id
    @payment = payment
    @upload = upload
    @pic = Magick::ImageList.new
    @draw = Magick::Draw.new
  end

  def report
    new_report
    draw_header
    draw_body
    save_report
  end

  def new_report
    @draw.stroke DRAW_STROKE
    @draw.fill_opacity 0
    @pic.new_image(PAGE_X, PAGE_Y) { self.background_color = IMAGE_BACKGROUND_COLOR }
    @draw.pointsize = DRAW_POINT_SIZE
    @draw.fill = DRAW_FILL
    @draw.undercolor = DRAW_UNDERCOLOR
  end

  def draw_header
    report_title
    page_number
    report_code
    report_columns
  end

  def draw_body
    @draw.fill = 'black'
    @draw.undercolor = '#aaa'
    height = 120

    payment.lines.each do |line|
      height += 21
      write(20, height, date(line.date))
      write(120, height, line.invoice)
      write(220, height, line.description)
      write(330, height, money(line.discount))
      write(420, height, money(line.amount))
      write(520, height, money(line.net))
    end
  end

  def report_title
    height = 30
    write(20, height, customer)
    write(220, height, payment.report_name)
    write(510, height, payment.report_date)
  end

  def page_number
    height = 60
    @draw.fill = 'red'
    write(20, height, payment.page)
  end

  def report_code
    height = 90
    @draw.fill = 'blue'
    @draw.undercolor = 'yellow'
    write(20, height, payment.code)
  end

  def report_columns
    height = 120
    write(20, height, 'Date')
    write(120, height, 'Invoice')
    write(220, height, 'Description')
    write(330, height, 'Discount')
    write(420, height, 'Amount')
    write(520, height, 'Net')
  end

  def save_report
    filename = FILE_NAME
    @pic.write filename
    u = @upload.new
    u.payment_id = payment.id
    u.report.attach filename
    u.report.attach(io: File.open("./#{filename}"),
                    filename: filename,
                    content_type: 'image/png')
    u.save
  end

  def write(left, height, content)
    @draw.annotate(@pic, OFFSET_X, OFFSET_Y, left, height, content) do
      self.gravity = Magick::NorthWestGravity
    end
  end

  def payment
    @p ||= @payment.find(load.payment_id)
  end

  def customer
    payment.customer.name
  end

  def load
    @load ||= @upload.find(@upload_id)
  end

  def money(str)
    ActionController::Base.helpers.number_to_currency(str)
  end

  def date(date)
    date.strftime('%m/%d/%Y')
  end
end
