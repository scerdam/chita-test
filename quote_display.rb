class QuoteDisplay
  def self.show(results)
    puts ''
    puts '#' * 15 + ' Resultads ' + '#' * 15
    puts ''
    puts "Costo de financiamiento: $#{results[:costo_financiamiento]}"
    puts "Giro a recibir: $#{results[:giro_a_recibir]}"
    puts "Excedentes: $#{results[:excedentes]}"
    puts ''
    puts '#' * 40
  end
end
