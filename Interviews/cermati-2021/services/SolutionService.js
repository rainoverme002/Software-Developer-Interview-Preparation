const fs = require('fs');


const writeSolutionToFile = function (res, filename) {
    const results = {
        'articles': res
    }
    const dictstring = JSON.stringify(results);
    fs.writeFile(filename, dictstring);
}

module.exports = {
    writeSolutionToFile
};