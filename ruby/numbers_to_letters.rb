puts "test" 

class Traduce
    
    def initialize    
        @translations = {
            1 => 'one',
            2 => 'two',
            3 => 'three',
            4 => 'four',
            5 => 'five',
            6 => 'six',
            7 => 'seven',
            8 => 'eight',
            9 => 'nine',
            10 => 'ten',
            11 => 'eleven',
            12 => 'twelve',
            13 => 'thirteen',
            14 => "fourteen",
            15 => "fifteen",
            16 => "sixteen",
            17 => "seventeen",
            18 => "eighteen",
            19 => "nineteen",
            20 => "twenty", 
            30 => "thirty",
            40 => "forty",
            50 => "fifty", 
            60 => "sixty",
            70 => "seventy",
            80 => "eighty",
            90 => "ninety"
        }
    end
    
  def convert(number)
    number = number.to_i
    if @translations.include?(number)
      return @translations[number]
    elsif(100..999).include?(number)
      number_to_hundreds(number)
    elsif(1000..9999).include?(number)
      a = @translations[number/1000]
      [a, 'thousand', number_to_hundreds(number%1000)].join(' ').strip
    elsif(10000..99999).include?(number)
      a = @translations[number/1000]
      [a, 'thousand', number_to_thousands(number%1000)].join(' ').strip
    else
      number_to_tens(number)
    end
  end
  
   def number_to_tens(number)
    return @translations[number] if @translations.include?(number)
    a = @translations[(number%100 - number % 10)]
    c = @translations[number%10]
    [a, '',  c].join(' ').strip
  end
  
  def number_to_hundreds(number)
    return number_to_tens(number%100) if number.to_s.length < 3
    [@translations[number/100], 'hundred', number_to_tens(number%100)].join(' ').strip
  end
  
  def number_to_thousands(number)
    return number_to_hundreds(number%100) if number.to_s.length < 3
    [@translations[number/1000], number_to_tens(number%10), 'hundred', number_to_tens(number%100)].join(' ').strip
  end
end


n = Traduce.new
puts n.convert('7')
puts n.convert('42')
puts n.convert('2001')
puts n.convert('1999')
puts n.convert('17999')
puts n.convert('19777')