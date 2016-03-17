namespace :appt_data_csv do
  desc 'Pulls data from appt_data.csv and imports to database'
  task data: :environment do
    csv = SmarterCSV.process('./appt_data.csv')
    # Created custom date formating for parsing the times
    @custom_date_format = '%m/%e/%y %k:%M'

    def get_time(time)
      t = DateTime.strptime(time, @custom_date_format)
      t = t.strftime('%I:%M %p')
    end

    def get_month(time)
      month = DateTime.strptime(time, @custom_date_format)
      month = month.strftime('%B')
    end

    def get_day(time)
      day = DateTime.strptime(time, @custom_date_format)
      day = day.strftime('%e')
    end

    def get_year(time)
      year = DateTime.strptime(time, @custom_date_format)
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