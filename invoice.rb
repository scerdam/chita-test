class Invoice
  attr_accessor :rut_emisor, :rut_receptor, :monto, :folio, :fecha_vencimiento

  def initialize(rut_emisor, rut_receptor, monto, folio, fecha_vencimiento)
    @rut_emisor = rut_emisor
    @rut_receptor = rut_receptor
    @monto = monto
    @folio = folio
    @fecha_vencimiento = fecha_vencimiento
  end

  def display_details
    puts ''
    puts "Rut Emisor: #{@rut_emisor}"
    puts "Rut Deudor: #{@rut_receptor}"
    puts "Monto de la factura: #{@monto}"
    puts "Folio: #{@folio}"
    puts "Fecha de vencimiento de la factura: #{@fecha_vencimiento}"
  end
end
