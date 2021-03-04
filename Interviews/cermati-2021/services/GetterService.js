const superagent = require('superagent');

const getHTMLPageContent = async function (url) {
  try {
    return res = await superagent.get(url);
  } catch (err) {
    console.error(err);
  }
}

module.exports = getHTMLPageContent;