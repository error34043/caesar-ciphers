# Gets input string
def input_str
  print 'Gimme a string: '
  inp_string = gets.chomp
end

# Checks that input shift is an integer and returns it
def check_shift(inp_shift)
  test = inp_shift.split("")
  test_val = true
  test.each do |char|
    if !(char.match(/[0-9]/)) && !(char.match("-"))
      test_val = false
      break
    else
      test_val = true
    end
  end
  if test_val == true
    test.join("").to_i
  else
    puts "Gimme a whole number only please, positive or negative"
    input_shift()
  end
end

# Gets the input shift and runs a type check function
def input_shift
  input_shift = ''
  print 'Gimme the shift: '
  input_shift = gets.chomp
  check_shift(input_shift)
end

# Shifts only the letters in the input string by the inputted shift value
def caesar(input_string,input_shift)
  shift = input_shift % 26  # Deals with larger shift values
  input_arr = input_string.split('')  # Converts string to array for easy manipulation

  ascii_arr = []
  final_ascii_arr = []
  changed_string_arr = []

  # Converts all letters (only) in the input string array to ASCII values
  input_arr.each do |i|
    if i.match(/[A-Z]/) || i.match(/[a-z]/)
      ascii_arr.push(i.ord)
    else
      ascii_arr.push(i.to_s)
    end
  end

  # Shifts each ASCII value in the input string array by the shift value, maintains case of letter and wraps from A-Z
  ascii_arr.each do |i|
    if i.is_a? Integer
      if i > 96 && i < 123
        changed_ascii = i + shift
        if changed_ascii < 97
          changed_ascii += 26
        elsif changed_ascii > 122
          changed_ascii -= 26
        end
        final_ascii_arr.push(changed_ascii)
      elsif i > 64 && i < 91
        changed_ascii = i + shift
        if changed_ascii < 65
          changed_ascii += 26
        elsif changed_ascii > 90
          changed_ascii -= 26
        end
        final_ascii_arr.push(changed_ascii)
      end  
    else
      final_ascii_arr.push(i)
    end
  end

  # Converts all shifted ASCII values back into letters and put each character in an array
  final_ascii_arr.each do |i|
    if i.is_a? Integer
      changed_string_arr.push(i.chr)
    else
      changed_string_arr.push(i)
    end
  end

  # Joins and returns the final array as a string
  changed_string = changed_string_arr.join('')
end

# Runs the program
user_str = input_str()
user_shift = input_shift()
puts "Your decoded string is: \"#{caesar(user_str, user_shift)}\"!"