#Задание №8

s=String.new(str="5 8 99 4 55 6 1 9 3")
max = s.split(" ").each{|i| i.to_i}.max
puts(print "Максимальное значение в строке #{s} = ", max)

#Задание №9

#Задача 1

def rus str
  amount = str.scan(/[А-я]/).size
  return amount
end

#Задача 9

def palindrom str
  check = str.scan(/[a-zа-я]/)
  if (check==check.reverse)
    return true
  else
    return false
  end
end

#Задача 18

def date str
  res=str.scan(/([0-2]\d|3[0-1]).(0[1-9]|1[0-2]|Январ[ь,я]|Феврал[ь,я]|Мар[т]|Март[а]|Апрел[ь,я]|Ма[й,я]|Июн[ь,я]|Июл[ь,я]|Авгус[т]|Август[а]|Сентябр[ь,я]|Октябр[ь,я]|Ноябр[ь,я]|Декабр[ь,я]).(\d{4})/).map{|e| e.join('.')}.join(", ")
  return res
end

def hub
  n=ARGV[0]
  case n
  when "1"
    puts "Задача №1"
    puts "Введите строку: "
    str=STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    rus(str)
    puts(print "Количество русских букв в строке #{str} = ", rus(str))
  when "9"
    puts "Задача №9"
    puts "Введите строку: "
    str=STDIN.gets.chomp
    palindrom(str)
    if palindrom("а роза упала на лапу азора")
      puts "Строчные буквы строки #{str} образуют палиндром"
    else
      puts "Строчные буквы строки #{str} не образуют палиндром"
    end
  when "18"
    puts "Задача №18"
    puts "Введите строку: "
    str=STDIN.gets.chomp
    date(str)
    puts(date(str))
  else
    puts ("У данной программы 3 варианта параметров: 1, 9, 18")
  end
end
hub
#Задание №10
def search_dates
  str="22 октября 1870 года, ровно 150 лет назад, родился известный русский писатель, поэт и переводчик, лауреат Нобелевской премии по литературе Иван Алексеевич Бунин. 28 Января 1820 года русская военно-морская экспедиция под руководством Фаддея Беллинсгаузена и Михаила Лазарева на шлюпах «Восток» и «Мирный» подошла к берегам Антарктиды."
  puts str.scan(/([0-2]\d|3[0-1]) (0[1-9]|1[0-2]|[я,Я]нвар[ь,я]|[ф,Ф]еврал[ь,я]|[м,М]ар[т]|Март[а]|[а,А]прел[ь,я]|[м,М]а[й,я]|[и,И]юн[ь,я]|[и,И]юл[ь,я]|[а,А]вгус[т]|[а,А]вгуст[а]|[с,С]ентябр[ь,я]|[о,О]ктябр[ь,я]|[н,Н]оябр[ь,я]|[д,Д]екабр[ь,я]) (\d{4})/).map{|e| e.join(' ')}.join(", ")
end


#Задание №11

#Задача 1
def max_num s

  max = s.scan(/\-\d+\.\d+|\d+\.\d+/).map{ |n| n.to_f }.max
  return max
end
puts(print "Максимальное значение в строке = ", max_num("5.5 -1.3 11.6 9.05"))

#Задача 9
def min_rat s
  min = s.scan(/[-+]?\d+\/(?:\d{2,}|[1-9])/).map{ |i| i.split("/").map{ |j| j.to_i } }.map{ |i| Rational(i[0], i[1]) }.min
  return min
end
puts(print "Минимальное значение в строке = ", min_rat("5/2 1/3 5/4"))
#Задача 18
def max_number_row s

  amount=s.split(/[a-zA-Z]/).uniq.map{|i| i.size}.max
  return amount
end
puts (print "Наибольшее количество идущих подряд цифр в строке '#{s}' = ", max_number_row("ghuy345gll5674g33g"))

def menu
  puts "Введите номер решаемой задачи"
  n=gets.to_i
  case n
  when 1
    puts "Задача №1"
    max_num()
  when 9
    puts "Задача №9"
    min_rat()
  when 18
    puts "Задача №18"
    max_number_row()
  else
    puts ("У данной программы 3 варианта параметров: 1, 9, 18")
  end
end

#Задание №12

def str_list
  string=File.open('test.txt', 'r:UTF-8') {|file| file.read}
  s=string.split(' ').sort_by{|i| i.size}
  puts (print s)
end


#Задание №13

def str_words
  string=File.open('test.txt', 'r:UTF-8') {|file| file.readlines.map {|i| i.strip}.filter{|i|!i.empty?}}
  s=string.sort_by{|i| i.split().size}
  puts (print s)
end
str_words

#Задание №14
def sort_words_after_nums
  string=File.open('test.txt', 'r:UTF-8') {|file| file.readlines.map {|i| i.strip}.filter{|i|!i.empty?}}
  s=string.sort_by{|i| i.scan(/\d+\s+([a-zA-Z]|[а-яА-Я])+/).size}
  puts (print s)
end
sort_words_after_nums

#Задание №15

#Задача 1
def sort_mean string
  s = string.sort_by{|i| ((i.scan(/([bcdfghjklmnpqrstwvxz]|[BCDFGHJKLMNPQRSTWVXZ])/).size.to_f/i.scan(/\w/).size.to_f)-(i.scan(/([aeiouy]|[AEIOUY])/).size.to_f/i.scan(/\w/).size.to_f)).abs}
  return s
end


#Задача 7
def sort_var string
  s = string.sort_by{|i| ((i.scan(/([aeiouy]|[AEIOUY])([bcdfghjklmnpqrstwvxz]|[BCDFGHJKLMNPQRSTWVXZ])/).size)-(i.scan(/([bcdfghjklmnpqrstwvxz]|[BCDFGHJKLMNPQRSTWVXZ])([aeiouy]|[AEIOUY])/).size)).abs}
  return s
end

#Задача 10

def triplet string
  count = 0
  s = string.sort_by{|i| i.delete(" ").each_char.each_cons(3){|s| p s.join==s.join.reverse}}
  return  s
end

def ex_select
  n=ARGV[0]
  case n
  when "1"
    puts "Задача №1"
    string=File.open('ex_15.txt', 'r:UTF-8') {|file| file.readlines.map {|i| i.strip}.filter{|i|!i.empty?}}
    puts (print sort_mean(string))
  when "7"
    puts "Задача №7"
    string=File.open('ex_15.txt', 'r:UTF-8') {|file| file.readlines.map {|i| i.strip}.filter{|i|!i.empty?}}
    puts (print sort_var(string))
  when "10"
    puts "Задача №10"
    string = File.open('ex_15.txt', 'r:UTF-8') {|file| file.readlines.map {|i| i.strip}.filter{|i|!i.empty?}}
    puts (print triplet(string))
  else
    puts ("У данной программы 3 варианта параметров: 1, 7, 10")
  end
end
ex_select
