require 'csv'
require 'colorize'

namespace :padron do
  desc 'Cargar padrón de elecciones'
  # Este task carga un padrón. Ejemplo de uso:
  # rails padron:cargar[archivo_del_padron.csv,2019]
  # El csv debe tener las columnas correctamente nombradas:
  #   documento: número de documento
  #   nombre: nombre y apellido
  #   carrera: título que obtuvo 
  task :cargar, [:archivo, :fecha] => :environment do |_, args|
    Rake::Task["padron:verificar_argumentos"].invoke(args[:archivo], args[:fecha])
    Rake::Task["padron:verificar_archivo"].invoke(args[:archivo])
    Rake::Task["padron:cargar_eleccion"].invoke(args[:fecha])
    Rake::Task["padron:cargar_graduados_y_empadronamientos"].invoke(args[:archivo])
  end

  desc 'Crea o encuentra un graduado y un empadronamiento'
  task :cargar_graduados_y_empadronamientos, [:archivo] => :environment do |_, args|
    print 'Task: cargar graduados y empadronamientos '.colorize(:green)

    CSV.foreach(args[:archivo], headers: true).with_index do |fila, i|
      @procesados = i

      if i % 10 == 0
        print '✓'.colorize(:green)
      end

      # Crea o encuentra al graduado.
      @graduado = Graduado.find_or_create_by(documento: fila['documento']) do |g|
        g.nombre = fila['nombre'].strip
        g.titulo = fila['carrera'].strip
      end

      # Crea o encuentra el empadronamiento.
      @eleccion.empadronamientos.find_or_create_by(graduado: @graduado)
    end
    puts "Graduados y empadronamientos procesados #{ @procesados } ✓".colorize(:green)
  end

  desc 'Crea o encuentra una eleccion'
  task :cargar_eleccion, [:fecha] => :environment do |_, args|

    @eleccion = Eleccion.find_or_create_by(ano: args[:fecha])
    if @eleccion.persisted?
      puts "Task: cargar elección #{ @eleccion.ano } ✓".colorize(:green)
    end
  end

  desc 'Verificar argumentos para padrón de elecciones'
  task :verificar_argumentos, [:archivo, :fecha] => :environment do |_, args|
    if !args[:fecha].match?(/^\d{4}$/)
      puts 'Task: verificar argumentos X'.colorize(:red)
      abort "  La fecha es incorrecta. Ejemplo de comando: rails padron:cargar[archivo_del_padron.csv,2019]"
    elsif !File.exists?(args[:archivo])
      puts 'Task: verificar argumentos X'.colorize(:red)
      abort "  El archivo no existe. Ejemplo de comando: rails padron:cargar[archivo_del_padron.csv,2019]"
    else
      puts 'Task: verificar argumentos ✓'.colorize(:green)
    end
  end

  desc 'Verificar integridad del archivo .csv'
  task :verificar_archivo, [:archivo] => :environment do |_, args|
    cantidad_de_filas = CSV.read(args[:archivo]).count

    CSV.foreach(args[:archivo]).with_index do |fila, i|
      if i == 0 && fila == ["documento", "nombre", "carrera"]
        puts 'Archivo: Integridad del Header ✓'.colorize(:green)
      elsif i == 0 && fila != ["documento", "nombre", "carrera"]
        puts 'Archivo: Integridad del Header X'.colorize(:red)
        abort "  El Header del archivo no corresponde a los siguientes campos: documento, nombre, carrera."
      elsif i != 0 && !fila.first.match?(/^\d*$/)
        puts "Archivo: Integridad de fila #{ i + 1 } #{ fila } X".colorize(:red)
        abort "  El documento debe estar compuesto solamente de números."
      elsif i == (cantidad_de_filas - 1)
        puts "Archivo: Integridad de #{ i } filas ✓".colorize(:green)
      end
    end
  end

end
