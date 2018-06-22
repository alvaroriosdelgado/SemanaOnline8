def crea_promedios
  alumnos = File.open('alumnos.csv', 'r')
  datos_alumnos = alumnos.readlines.map(&:chomp)
  alumnos.close

  datos_alumnos.each do |lineas|
    array_x_linea = lineas.split(', ')
    nombre_alumno = array_x_linea.delete_at(0)
    array_x_linea.map(&:to_i)
    suma = array_x_linea.inject(0) { |acu, notas| acu + notas.to_i }
    promedios = suma / array_x_linea.size.to_f
    promedios_x_alumno = File.open('promedios.csv', 'a')
    promedios_x_alumno.puts "#{nombre_alumno}: #{promedios}"
  end
end

def crea_inasistencias
  alumnos = File.open('alumnos.csv', 'r')
  datos_alumnos = alumnos.readlines.map(&:chomp)
  alumnos.close

  datos_alumnos.each do |lineas|
    array_x_linea = lineas.split(', ')
    nombre_alumno = array_x_linea.delete_at(0)
    array_x_linea.map
    cont_inasistencias = 0
    if array_x_linea.include?('A')
      cont_inasistencias += 1
    else
      cont_inasistencias = 0
    end
    inasistencias_x_alumno = File.open('inasistencias.csv', 'a')
    inasistencias_x_alumno.puts "#{nombre_alumno}: #{cont_inasistencias}"
  end
end

def crea_aprobados(nmin)
  alumnos = File.open('alumnos.csv', 'r')
  datos_alumnos = alumnos.readlines.map(&:chomp)
  alumnos.close
  datos_alumnos.each do |lineas|
    array_x_linea = lineas.split(', ')
    nombre_alumno = array_x_linea.delete_at(0)
    array_x_linea.map(&:to_i)
    suma = array_x_linea.inject(0) { |acu, notas| acu + notas.to_i }
    promedios = suma / array_x_linea.size.to_f
    estado_alumnos = File.open('aprobados.csv', 'a')
    if promedios < nmin
      estado_alumnos.puts "El alumno: #{nombre_alumno} se encuentra reprobado"
    else
      estado_alumnos.puts "El alumno: #{nombre_alumno} se encuentra aprobado"
    end
    estado_alumnos.close
  end
end

opcion = 0
while opcion != 4
  puts 'Opcion 1.- Genera listado de alumnos con el promedio de sus notas'
  puts 'Opcion 2.- Genera listado de inasistencias por alumno'
  puts 'Opcion 3.- Genera listado de alumnos aprobados'
  puts 'Opcion 4.- Salir del programa'

  puts 'Ingresa una opción'
  opcion = gets.chomp.to_i
  case opcion
  when 1
    puts 'Se han generado los promedios por alumno'
    puts 'Elija otra opción o presione 4 para salir', "\n"
    crea_promedios
  when 2
    puts 'Se han generado las inasistencias por alumno'
    puts 'Elija otra opción o presione 4 para salir', "\n"
    crea_inasistencias
  when 3
    puts 'Ingrese nota mínima de aprobación: '
    nota_minima = gets.chomp.to_i
    crea_aprobados(nota_minima)
    puts 'Se ha generado el listado de alumnos aprobados y reprobados'
    puts 'Elija otra opción o presione 4 para salir', "\n"
  when 4
    puts 'Programa Finalizado'
    exit
  end
end
