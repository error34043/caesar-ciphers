caesar = (strInp, shiftInp) ->
    outputArr = []
    letterRegex = /[a-z]/i
    shift = 0

    if shiftInp > 26 || shiftInp < -26
        shift = shiftInp % 26
    else
        shift = shiftInp
    
    for char, index in strInp
        if letterRegex.test(char)
            charcode = strInp.charCodeAt(index)

            if charcode >= 65 && charcode <= 90
                charcode += shift
                if charcode < 65
                    remainder = 65 - charcode
                    charcode = 91 - remainder
                    outputArr.push(String.fromCharCode charcode)
                else if charcode > 90
                    remainder = charcode - 90
                    charcode = 64 + remainder
                    outputArr.push(String.fromCharCode charcode)
                else
                    outputArr.push(String.fromCharCode charcode)
            else
                charcode += shift
                if charcode < 97
                    remainder = 97 - charcode
                    charcode = 122 - remainder
                    outputArr.push(String.fromCharCode charcode)
                else if charcode > 122
                    remainder = charcode - 122
                    charcode = 96 + remainder
                    outputArr.push(String.fromCharCode charcode)
                else
                    outputArr.push(String.fromCharCode charcode)
        else
            outputArr.push(char)
    output = outputArr.join('')


userStr = prompt 'What is the coded string/string to code?'
userShift = prompt 'What is the shift?'

console.log "Your decoded/coded string is '#{caesar(userStr, userShift)}'!"