require 'net/http'
require 'json'

class APIClient
  API_URL = 'https://chita.cl/api/v1/pricing/simple_quote'.freeze
  API_KEY = 'pZX5rN8qAdgzCe0cAwpnQQtt'.freeze

  def self.get_quote(invoice)
    uri = URI(API_URL)
    params = {
      client_dni: invoice.rut_emisor,
      debtor_dni: invoice.rut_receptor,
      document_amount: invoice.monto,
      folio: invoice.folio,
      expiration_date: invoice.fecha_vencimiento
    }
    uri.query = URI.encode_www_form(params)
    req = Net::HTTP::Get.new(uri)
    req['X-Api-Key'] = API_KEY

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end

    JSON.parse(res.body)
  end
end
