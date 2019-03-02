module ApplicationHelper
    def convert_to_celcius(kelvin)
        kelvin - 273.15
    end

    def convert_to_weekday(date)
        Date.parse(date).strftime("%A")
    end
end
