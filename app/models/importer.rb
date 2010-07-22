class Importer
  class << self
    def init_fastercsv
      FasterCSV::HeaderConverters.merge!(:transaction_headers => lambda{|h|
        case h
        when "Saldo"
          'balance'
        when "Beløb"
          'amount'
        when "Dato"
          'created_on'
        when "Tekst"
          'text'
        when 'Afstemt'
          'afstemt'
        else
          h
        end
        })
    end
    def transactions
      init_fastercsv
      filename = "/Users/jacob/Downloads/loenkonto-1.csv"
      csvcontent = Iconv::iconv("utf8", "iso8859-1", File.read(filename))[0]
      FasterCSV.parse(csvcontent, :headers => true, :header_converters => :transaction_headers, :col_sep => ",") do |row|
        if row.to_hash['Status'] == "Udført"
          begin
            data = row.to_hash.except('Status')
            data['amount'] = data['amount'].gsub(".", "").gsub(",","")
            data['balance'] = data['balance'].gsub(".", "").gsub(",","")
            created_on_parts = data['created_on'].match('(\d+)\.(\d+)\.(\d+)').to_a
            data['created_on'] = Date.parse("#{created_on_parts[2]}/#{created_on_parts[1]}/#{created_on_parts[3]}")
            Transaction.create! data.merge(:account_id => 1)
          rescue
            puts "Could not create transaction for"
            p data
            # raise
          end
        end
      end
    end
  end
end