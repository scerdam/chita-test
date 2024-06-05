require 'date'

class QuoteCalculator
  def self.calculate(invoice, quote)
    document_rate = quote['document_rate']
    commission = quote['commission']
    advance_percent = quote['advance_percent'] / 100.0

    monto_factura = invoice.monto
    fecha_vencimiento = Date.parse(invoice.fecha_vencimiento)
    dias_plazo = (fecha_vencimiento - Date.today).to_i + 1

    costo_financiamiento = (monto_factura * advance_percent) * (document_rate / 100 / 30 * dias_plazo)
    giro_a_recibir = (monto_factura * advance_percent) - (costo_financiamiento + commission)
    excedentes = monto_factura - (monto_factura * advance_percent)

    {
      costo_financiamiento: costo_financiamiento.round,
      giro_a_recibir: giro_a_recibir.round,
      excedentes: excedentes.round
    }
  end
end
