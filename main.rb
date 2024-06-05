require_relative 'invoice'
require_relative 'api_client'
require_relative 'quote_calculator'
require_relative 'quote_display'

puts 'Desea ejecutar el programa con los datos de ejemplo? (si/no)'
user_option_input = gets.chomp

if user_option_input.downcase == 'si'
  invoice_sample = Invoice.new('76329692-K', '77360390-1', 1_000_000, 75, '2024-07-05')
  puts 'Datos de ejemplo: '
  invoice_sample.display_details
  invoice = invoice_sample
else
  print 'Ingrese el RUT del emisor (eg: 76329692-K): '
  rut_emisor = gets.chomp

  print 'Ingrese el RUT del receptor (eg: 77360390-1): '
  rut_receptor = gets.chomp

  print 'Ingrese el monto de la factura (eg: 1000000): '
  monto = gets.chomp.to_f

  print 'Ingrese el monto de la factura folio: (eg: 75): '
  folio = gets.chomp.to_f

  print 'Ingrese la fecha de vencimiento de la factura (eg: 2024-07-04): '
  fecha_vencimiento = gets.chomp

  invoice = Invoice.new(rut_emisor, rut_receptor, monto, folio, fecha_vencimiento)
end

quote = APIClient.get_quote(invoice)

results = QuoteCalculator.calculate(invoice, quote)

QuoteDisplay.show(results)
