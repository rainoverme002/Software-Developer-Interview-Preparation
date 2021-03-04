const sanitizeHTML = function (content) {
    content = content.replace(/^\s+|\s+$/g, '')
    return content.replace(/\r?\n|\r/g, '').trim()
}

module.exports = {
    sanitizeHTML
};