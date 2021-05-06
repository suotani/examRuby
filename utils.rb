require 'fileutils'
require "json"
QUESTION_NUMBERS = (1..3).to_a.map(&:to_s)
INPUT_EXIST = {
  "1": false, "2": true,
}

def write_result(question_number, result)
  file = File.open('./results.json')
  hash = JSON.load(file.read)
  file.close
  hash = {} if hash == nil
  hash[question_number] = result
  File.open("./results.json", "w") do |file|
    JSON.dump(hash, file)
  end
end


def check_program(question_number)
  system("rm ./tmp") if File.exist?("./tmp")
  input_file_cmd = INPUT_EXIST[question_number.to_sym] ? "cat ./answers/#{question_number}.txt | " : ""
  system(input_file_cmd + "ruby ./questions/#{question_number}.rb >> ./tmp")
  FileUtils.cmp('./tmp', "./answers/#{question_number}")
end