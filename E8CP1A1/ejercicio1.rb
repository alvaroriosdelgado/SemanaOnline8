def index(texto1, texto2)
  archivo = File.open('index.html', 'w')
  archivo.puts "<p>#{texto1}</p>"
  archivo.puts "<p>#{texto2}</p>"
  archivo.close
end
index('cadena1', 'cadena2')

arr = [4, 8, 3, 14, 1, 6]
def arreglo(datos)
  archivo = File.open('index.html', 'a')

  archivo.puts '<ol>'
  datos.each_with_index do |_v, i|
    archivo.puts "<li>#{datos[i]}</li>"
  end
  archivo.puts '</ol>'
end
arreglo(arr)

def asignacolor(color)
  arreglo = File.open('index.html', 'r')
  print arreglo.read
end
asignacolor('gray')
