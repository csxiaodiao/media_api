require 'csv'    

csv_text = File.read('db/media.csv')
csv = CSV.parse(csv_text, :headers => true)
records = csv.map do |row|
  real_price = (row[6].to_i)*1.5.ceil
  {
    name: row[0],
    collection_type: row[1],
    region: row[2],
    portal_type: row[3],
    collection_effect: row[4],
    channel_type: row[5],
    real_price: real_price,
    price: real_price * 2,
    url: row[7],
    remarks: row[9],
  }

end

Medium.create(records)

