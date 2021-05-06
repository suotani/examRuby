require "./utils"
arg = ARGV[0]

if arg =~ /^[0-9]+$/
  question_number = arg
  result = check_program(question_number)
  write_result(question_number, result)
  if result
    puts "Question #{arg} is Success!(^^)"
  else
    puts "Question #{arg} is Failer(T ^ T)"
  end
elsif arg == "status"
  p "s"
elsif arg == "all"
  QUESTION_NUMBERS.each do |question_number|
    result = check_program(question_number)
    write_result(question_number, result)
    if result
      puts "Question #{question_number} is Success!(^^)"
    else
      puts "Question #{question_number} is Failer(T ^ T)"
    end
  end
end
