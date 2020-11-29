#Ejercicio Herencia y UML
class Appointment    #Clase Padre
    def initialize(location, purpose, hour, min)
        raise ArgumentError, "location must be a String" if(location.class != String)
        raise ArgumentError, "purpose must be a String" if(purpose.class != String)
        raise ArgumentError, "hour must be an Integer" if(hour.class != Integer)
        raise ArgumentError, "min must be an Integer" if(min.class != Integer)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end

    def location
        @location
    end

    def purpose
        @purpose
    end

    def hour
        @hour
    end

    def min
        @min
    end
end

class MonthlyAppointment < Appointment
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min)
        raise ArgumentError, "day must be an Integer" if(day.class != Integer)
        @day = day
    end

    def day
        @day
    end

    def occurs_on?(day)
        raise ArgumentError, "occurs_on? Argument must be an Integer" if(day.class != Integer)
        @day == day
    end

    def to_s
        "Reunion mensual en #{self.location} sobre #{self.purpose} el dia #{self.day} a la(s) #{self.hour}:#{self.min}."
    end
end

class DailyAppointment < Appointment
    def occurs_on?(hour, min)
        raise ArgumentError, "occurs_on? Arguments must be Integers" if(hour.class != Integer || min.class != Integer)
        @hour == hour && @min == min
    end

    def to_s
        "Reunion diaria en #{self.location} sobre #{self.purpose} a la(s) #{self.hour}:#{self.min}."
    end
end

class OneTimeAppointment < Appointment
    def initialize(location, purpose, hour, min, day, month, year)
        super(location, purpose, hour, min)
        raise ArgumentError, "day must be an Integer" if(day.class != Integer)
        raise ArgumentError, "month must be an Integer" if(month.class != Integer)
        raise ArgumentError, "year must be an Integer" if(year.class != Integer)
        @day = day
        @month = month
        @year = year
    end

    def occurs_on?(day, month, year)
        raise ArgumentError, "occurs_on? Arguments must be Integers" if(day.class != Integer || month.class != Integer || year.class != Integer)
        @day == day && @month == month && @year == year
    end

    def to_s
        "Reunion unica en #{self.location} sobre #{self.purpose} el #{@day}/#{@month}/#{@year} a la(s) #{self.hour}:#{self.min}."
    end
end

puts OneTimeAppointment.new('Desafio Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts DailyAppointment.new('Desafio Latam', 'Educacion', 8, 15)
puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)