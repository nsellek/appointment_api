namespace :appt_data_crv do
  desc 'TODO'
  task data: :environment do
    csv = SmarterCSV.process('./appt_data.csv')

    def get_time(time)
      t = Time.parse(time)
      t = t.strftime('%r')
    end

    def get_month(time)
      month = Time.parse(time)
      month = month.strftime('%B')
    end

    def get_day(time)
      day = Time.parse(time)
      day = day.strftime('%d')
    end

    def get_year(time)
      year = Time.parse(time)
      year = year.strftime('%Y')
    end

    csv.each do |line|
      start_time = get_time(line[:start_time])
      end_time = get_time(line[:end_time])
      first_name = line[:first_name]
      last_name = line[:last_name]
      month = get_month(line[:start_time])
      day = get_day(line[:start_time])
      year = get_year(line[:start_time])

      appointment = Appointment.create!(
        start_time: start_time, 
        end_time: end_time, 
        month: month, 
        day: day, 
        year: year, 
        first_name: first_name,
        last_name: last_name
        )
    end
  end
end