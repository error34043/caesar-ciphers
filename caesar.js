const caesar = (strInp, shiftInp) => {
    let outputArr = [];
    let letterRegex = /[a-z]/i;
    let shift = 0;

    if (shiftInp > 26 || shiftInp < -26) {
        shift = shiftInp % 26;
    } else {
        shift = shiftInp;
    };

    for (let i = 0; i < strInp.length; i++) {
        if (letterRegex.test(strInp[i]) === true) {
            let charcode = 0;
            charcode = strInp.charCodeAt(i);

            if (charcode >= 65 && charcode <= 90) {
                charcode += shift;
                if (charcode < 65) {
                    remainder = 65 - charcode;
                    charcode = 91 - remainder;
                    outputArr.push(String.fromCharCode(charcode));
                } else if (charcode > 90) {
                    remainder = charcode - 90;
                    charcode = 64 + remainder;
                    outputArr.push(String.fromCharCode(charcode));
                } else {
                    outputArr.push(String.fromCharCode(charcode));
                }
            } else {
                charcode += shift;
                if (charcode < 97) {
                    remainder = 97 - charcode;
                    charcode = 122 - remainder;
                    outputArr.push(String.fromCharCode(charcode));
                } else if (charcode > 122) {
                    remainder = charcode - 122;
                    charcode = 96 + remainder;
                    outputArr.push(String.fromCharCode(charcode));
                } else {
                    outputArr.push(String.fromCharCode(charcode));
                };
            }
        } else {
            outputArr.push(strInp[i]);
        };
    };

    output = outputArr.join("");
    return output;
};

const inp_str = prompt('What is the coded string/string to code?');
const inp_shift = prompt('What is the shift?');

console.log(`Your decoded/coded string is ${caesar(inp_str,inp_shift)}`);
